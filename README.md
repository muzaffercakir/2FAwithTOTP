## Golang OTP(One Time Password) ile Two Factor Authentication Login İşlemleri

Bu projede; Google Authenticator gibi doğrulama sağlayan istemcilerden alınan tek seferlik şifreler ile 2 faktörlü doğrulama kullanılarak Login-Logout işlemleri yapılmıştır.

UI tasarımına derinlemesine odaklanılmamıştır.

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
<br />

**Demo Video**   <br />

https://user-images.githubusercontent.com/98349765/186845725-3a537b8d-dc1b-42c3-85f7-013c2c82f821.mp4   <br />        



**Demo GIF** <br /> <br />



![demo-gif2](https://user-images.githubusercontent.com/98349765/186845825-8d4fafc9-5027-4cf1-a701-f4f51fbd4dc3.gif)
