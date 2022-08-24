package controllers

import (
	"fmt"
	"image/png"
	"os"
	lib "otpAuth/library"
	"otpAuth/models"

	"github.com/asaskevich/govalidator"
	"github.com/beego/beego"
	"github.com/beego/beego/orm"
	"github.com/boombuler/barcode"
	"github.com/boombuler/barcode/qr"
	"github.com/mdp/qrterminal"
	"github.com/pquerna/otp"
	"github.com/pquerna/otp/totp"
)

type Base struct {
	beego.Controller
	IsLogin bool
	User    *models.DemoUser
}

type NestPreparer interface {
	NestPrepare()
}

type NestFinisher interface {
	NestFinish()
}

var totpCheckflag bool //2fa key girildikten sonra yapılan Post isteğinden sonra aynı sayfada yeni bir TOTP Key Generate etmeyi önlemek için kontrol edilen Flag

var key *otp.Key //Farklı metodlarda doğrulama yapılırken aynı userın TOTP SecretKeyi değişmemesi için tanımlanan global değişken

func (c *Base) NestPrepare() {

	c.User = c.getUser()
	c.Data["User"] = c.User

}

func (c *Base) Prepare() {
	c.EnableXSRF = true
	c.Data["xsrf_token"] = c.XSRFToken()

	//c.Data["RequestURI"] = c.Ctx.Request.RequestURI

	if app, ok := c.AppController.(NestPreparer); ok {
		app.NestPrepare()
	}
	//flash için
	beego.ReadFromRequest(&c.Controller)

}

func (c *Base) Finish() {
	if app, ok := c.AppController.(NestFinisher); ok {
		app.NestFinish()
	}
}

func (c *Base) getUser() *models.DemoUser {
	id, ok := c.GetSession("user").(int64)
	if !ok {
		return nil
	}
	user := &models.DemoUser{Id: id}
	if err := orm.NewOrm().Read(user); err != nil {
		beego.Error(err)
		c.Abort("500")
		return nil
	}
	return user
}

func (c *Base) Index() {

	if c.IsLogin {
		c.Redirect(c.URLFor("Base.Admin"), 303)
		return
	}

	c.TplName = "login.tpl"

	if !c.Ctx.Input.IsPost() {
		return
	}

	flash := beego.NewFlash()

	email := c.GetString("email")
	password := c.GetString("password")

	c.Data["LoginForm"] = email

	if !govalidator.IsEmail(email) {
		flash.Error("(!)Invalid e-mail address")
		flash.Store(&c.Controller)
		return
	}

	users := &models.DemoUser{}
	o := orm.NewOrm().QueryTable("DemoUser")

	if err := o.Filter("Email", email).One(users); err != nil {
		flash.Error("Geçersiz email veya parola!")
		flash.Store(&c.Controller)
		return
	}

	if _, err := lib.CryptoPassword(password, users.Password); err != nil {

		flash.Error("Geçersiz email veya parola!")
		flash.Store(&c.Controller)
		return
	}

	if err := o.Filter("Email", email).Filter("IsOtpActive", true).One(users); err != nil {
		c.SetSession("user", users.Id)
		flash.Success("Giriş Başarılı.2FA Devre Dışı.")
		flash.Store(&c.Controller)
		c.Redirect(c.URLFor("Base.Admin"), 303)

	} else if err == nil {
		c.SetSession("user", users.Id)
		fmt.Println("Doğrulama sayfasına yönlendiriliyorsunuz.")
		c.Redirect(c.URLFor("Base.LoginAuthPage"), 303)
	}

}

//Kullanıcı Profili İçin
func (c *Base) Admin() {
	c.IsLogin = c.GetSession("user") != nil
	if !c.IsLogin && c.URLFor("Base.Index") != c.Ctx.Request.RequestURI {
		c.Redirect(c.URLFor("Base.Index"), 303)
		return
	}

	c.Data["User"] = c.User
	c.TplName = "admin.tpl"

	if !c.Ctx.Input.IsPost() {
		return
	}

}

//Yeni Kayıt
func (c *Base) Create() {

	c.TplName = "create.tpl"

	if !c.Ctx.Input.IsPost() {
		return
	}

	new := models.DemoUser{
		Email:       c.GetString("email"),
		Password:    "",
		OtpSecret:   "",
		IsOtpActive: false,
	}
	c.Data["SignUpForm"] = new

	flash := beego.NewFlash()

	if !govalidator.IsEmail(new.Email) {
		flash.Error("Geçerli bir email adresi giriniz!")
		flash.Store(&c.Controller)
		return
	}

	if len(c.GetString("password")) < 3 {
		flash.Error("En az 3 haneli bir şifre giriniz!")
		flash.Store(&c.Controller)
		return
	}

	if c.GetString("repassword") != c.GetString("password") {
		flash.Error("Girdiğiniz şifreler uyuşmuyor!")
		flash.Store(&c.Controller)
		return
	}

	new.Password, _ = lib.CryptoPassword(c.GetString("password"), "create")

	if _, err := orm.NewOrm().Insert(&new); err != nil {
		beego.Error(err)
		c.Abort("500")
		return
	}
	flash.Success("(✓) Üyeliğiniz Başarıyla Gerçekleşti.Profilinize Giriş Yapabilirsiniz.")
	flash.Store(&c.Controller)
	c.Redirect(c.URLFor("Base.Login"), 303)

}

//Authenticator istemcileriyle ilk eşleştirme yapılırken kullanılır
func (c *Base) AuthPage() {

	c.Data["CreateAuth"] = c.User

	c.TplName = "createauth.tpl"

	flash := beego.NewFlash()

	//Google-Authenticator ile uyumluluk için varsayılan ayarları değiştirir.
	//Default algoritma: SHA1, TOTP period: 30sn, SecretSize 20byte dır.
	options := totp.GenerateOpts{
		Issuer:      "Muzaffer_OTP_Project", //Organizasyon/Kuruluş Adı
		AccountName: c.User.Email,           //Kullanıcı Hesabı
	}

	if !totpCheckflag {

		//verilen options lara göre TOTP Key Üretir
		key, _ = totp.Generate(options)

		//Generate edien keyden 20bytelık SecretKeyi döndürür
		c.Data["SecretKey"] = key.Secret()

		//verilen string parametresiyle kodlanmış bir QR Kod Oluşturur
		qrCode, _ := qr.Encode(key.String(), qr.L, qr.Auto)
		qrCode, _ = barcode.Scale(qrCode, 256, 256)

		file, _ := os.Create("static/img/qrcode.png")
		defer file.Close()

		//oluşrulan qrCode file'ı png formatına kodlar
		png.Encode(file, qrCode)

		//(---Ekstra---)
		//Terminalde QR Kod oluşturur---verilen stringle kodlanır.
		qrterminal.GenerateHalfBlock(key.String(), qrterminal.L, os.Stdout)

		totpCheckflag = true
	}

	if !c.Ctx.Input.IsPost() {
		return
	}

	if !c.User.IsOtpActive {

		var validateFlag bool //doğrulamanın durumunu kontrol eden flag

		for !validateFlag {

			fmt.Printf("Code: ")
			passcode := c.GetString("2fapassword")

			//Üretilen Secret key ile girilen şifreyi kontrol ederek validasyonu kontrol eder.
			//Eşleşme olursa SecretKey o user için kaydedilir.
			if totp.Validate(passcode, key.Secret()) {

				c.User.OtpSecret = key.Secret()
				c.User.IsOtpActive = true

				if _, err := orm.NewOrm().Update(c.User); err != nil {
					beego.Error(err)
					return
				}
				totpCheckflag = false
				validateFlag = true
				flash.Success("(✓) 2FA Başarıyla Etkinleştirildi.")
				flash.Store(&c.Controller)
				c.Redirect(c.URLFor("Base.Admin"), 303)
				break
			} else {

				flash.Error("Geçersiz Kod!")
				flash.Store(&c.Controller)
				return

			}
		}

	} else {
		totpCheckflag = false
		flash.Warning("2FA ayarını devre dışı bıraktınız.")
		flash.Store(&c.Controller)
		c.Redirect(c.URLFor("Base.Admin"), 303)
	}

}

//2FA aktif ise OTP ile Login olmayı sağlar
func (c *Base) LoginAuthPage() {
	c.Data["LoginAuth"] = c.User

	c.TplName = "loginauth.tpl"

	if !c.Ctx.Input.IsPost() {
		return
	}

	flash := beego.NewFlash()

	//Google-Authenticator ile uyumluluk için varsayılan ayarları değiştirir.
	//Default algoritma: SHA1, TOTP period: 30sn, SecretSize 20byte dır.
	options := totp.GenerateOpts{
		Issuer:      "Muzaffer_OTP_Project",
		AccountName: c.User.Email,
	}

	//verilen options lara göre TOTP Key Üretir
	loginKey, err := totp.Generate(options)
	if err != nil {
		beego.Error(err)
	}

	//Generate edien keeyden 20bytelık SecretKeyi döndürür
	c.Data["SecretKey2"] = loginKey.Secret()

	if c.User.IsOtpActive {

		var validateFlag bool //doğrulamanın durumunu kontrol eden flag

		for !validateFlag {

			passcode := c.GetString("2fapassword")

			//Userın Secret keyi ile girilen şifreyi kontrol ederek validasyonu kontrol eder
			if totp.Validate(passcode, c.User.OtpSecret) {

				c.SetSession("user", c.User.Id)
				validateFlag = true

				flash.Success("Giriş Başarılı")
				flash.Store(&c.Controller)
				c.Redirect(c.URLFor("Base.Admin"), 303)

			} else {

				flash.Error("Geçersiz Kod!")
				flash.Store(&c.Controller)
				return

			}

		}

	} else {
		c.SetSession("user", c.User.Id)
		flash.Success("Giriş Başarılı.2FA Devre Dışı.")
		flash.Store(&c.Controller)
		c.Redirect(c.URLFor("Base.Admin"), 303)
	}

}

func (c *Base) Logout() {

	c.DelSession("user")
	c.Redirect(c.URLFor("Base.Index"), 303)

}

func (c *Base) Set2faInactive() {

	c.User.OtpSecret = ""
	c.User.IsOtpActive = false

	if _, err := orm.NewOrm().Update(c.User); err != nil {
		beego.Error(err)
		return
	}

	flash := beego.NewFlash()
	flash.Success("(✓) 2FA Devre Dışı Bırakıldı.")
	flash.Store(&c.Controller)
	c.Redirect(c.URLFor("Base.Admin"), 303)

}
