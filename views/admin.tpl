<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
</head>
<body>
    <div>
        <h1>Giriş Başarılı...</h1>
        <p> Hoşgeldin, <strong>{{.User.Email}}</strong> </p>
        <p> İki Faktörlü Doğrulama(2FA) = <strong>{{if .User.IsOtpActive}}Aktif{{else}}Pasif{{end}}</strong></p>
        <div>
            (!) Hesabınızın güvenliğini arttırmak için iki faktörlü doğrulamanın aktif olması önerilir.
        </div>
        <div style="margin-top: 1em">
            {{if .User.IsOtpActive}}
            <a href="/admin/authinactive">
                <button>Devre Dışı Bırak</button>
            </a>
            {{else}}
            <a href="/admin/auth">
                <button>Aktifleştir</button>
            </a>
            {{end}}
        </div>     
    </div>

    <div>
        <a href="/admin/logout">
            <button type="submit" style="margin-top: 1em;">Çıkış Yap</button>
        </a>
    </div>

    

    {{template "layout/flash.tpl" .}}
</body>
</html>