<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoginAuth</title>
</head>

<body>
    <h1>Login with 2FA</h1>
    <div>
        <p>{{.CreateAuth.Email}}</p>
        İki Faktörlü Doğrulama(2FA) = <strong>{{if .User.IsOtpActive}}Aktif{{else}}Pasif{{end}}</strong>
        <p>(!) Yetkilendirme İstemcinizi(Google Authenticator v.b) ayarlamak için kullanabileceğiniz kodunuz:</p>
        <strong>{{.SecretKey}}</strong>
        <p>(!) Kodu manuel olarak girmek istemiyorsanız aşağıdaki QR Kodu okutun.</p>
        <img class="text-white" src="/static/img/qrcode.png" alt="QR Code Barkod" > 
    </div>
    <div>
        <form action="" method="POST">
            <input type="hidden" name="_xsrf" value="{{ .xsrf_token }}" /> 
            <div style="margin-top: 1em; margin-bottom: 1em">
                (!) Yetkilendirme İstemciniz ile eşleştirmeyi yaptıysanız 6 haneli Tek Kullanımlık Şifreyi giriniz: 
            </div>
            <label class="col-md-3 form-label">2FA Key</label>
            <input type="text" class="form-control" value="" autocomplete="off" name="2fapassword">
            <button type="submit">Onayla</button>

        </form>
    
    </div>


    {{template "layout/flash.tpl" .}}
</body>

</html>