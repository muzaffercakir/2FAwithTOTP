## Golang OTP(One Time Password) ile Two Factor Authentication Login İşlemleri

Bu projede; Google Authenticator gibi doğrulama sağlayan istemcilerden alınan tek seferlik şifreler ile 2 faktörlü doğrulama kullanılarak Login-Logout işlemleri yapılmıştır.
UI tasarımına odaklanılmamıştır.
Geliştirilmeye devam edildikçe güncellenecektir.

Go için web geliştirme frameworklerinden [**beego**](https://github.com/beego/beego) kullanılmıştır.

 2FA TOTP doğrulaması için [**pquerna/otp**](https://github.com/pquerna/otp) kütüphanesi kullanılmıştır.

 - Google Authenticator
 - Microsoft Authenticator
 - Twilio Authy

 Doğrulayıcılarıyla uyumludur.

**Repo İçin**

```bash
go get github.com/muzaffercakir/2FAwithTOTP
```
**Kullanım**

Projede veritabanı olarak `MySQL` kullanılmıştır.
`otpauth` adlı bir veritabanı oluşturulmuştur.
Veritabanı bilgileri `.env` dosyasına ayarlanmalıdır.
Örnek `.env` dosyası için: [**Tıklayınız**](/env.example).

**Demo**



![demo-gif](https://user-images.githubusercontent.com/98349765/186287802-f51490f6-33ea-4614-94b2-97ef0be6763c.gif)
