package main

import (
	"otpAuth/controllers"
	lib "otpAuth/library"
	_ "otpAuth/models"
	_ "otpAuth/routers"

	"time"

	"github.com/beego/beego"
	"github.com/beego/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func buildUrl() string {
	return lib.ConfigGet("mysqluser") + ":" + lib.ConfigGet("mysqlpass") + "@tcp(" + lib.ConfigGet("mysqlhost") + ":3306)/" + lib.ConfigGet("mysqldb") + "?charset=utf8&loc=Europe%2FIstanbul"
}

func main() {

	if err := beego.LoadAppConfig("ini", ".env"); err != nil {
		beego.Error(err)
	}

	beego.BConfig.ServerName = "otpAuth Web Server"
	beego.BConfig.AppName = "2FA Using OTP"

	beego.BConfig.Listen.HTTPAddr = "localhost"
	if beego.BConfig.RunMode != "dev" {
		beego.BConfig.Listen.HTTPAddr = ""
	}
	beego.BConfig.Listen.EnableAdmin = true
	beego.BConfig.Listen.AdminAddr = "localhost"
	beego.BConfig.Listen.AdminPort = 8088

	beego.BConfig.WebConfig.DirectoryIndex = false
	beego.BConfig.WebConfig.Session.SessionOn = true

	beego.BConfig.WebConfig.FlashName = "FLASH"
	beego.BConfig.WebConfig.FlashSeparator = "SFLASH"

	beego.BConfig.WebConfig.EnableXSRF = true
	beego.BConfig.WebConfig.XSRFKey = "Mb4*Qt4~Fx4&Ad5$"
	beego.BConfig.WebConfig.XSRFExpire = 86400

	beego.BConfig.WebConfig.Session.SessionProvider = "file"
	beego.BConfig.WebConfig.Session.SessionProviderConfig = "/tmp"

	if err := orm.RegisterDriver("mysql", orm.DRMySQL); err != nil {
		beego.Error(err)

	}
	if err := orm.RegisterDataBase("default", "mysql", buildUrl()); err != nil {
		beego.Error(err)
	}
	if err := orm.SetDataBaseTZ("default", time.Now().Location()); err != nil {
		beego.Error(err)
	}

	//veritabanı ilk kez oluştururken kullanılır.
	//beego.Error(orm.RunSyncdb("default", true, true))

	beego.ErrorController(&controllers.Error{})
	beego.Run()
}
