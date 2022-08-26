<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <title>Admin</title>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <h1 class="text-success mb-3">Giriş Başarılı <i class="bi bi-check-lg"></i></h1>
                <div class="alert alert-primary" role="alert">
                    <p> Hoşgeldin, <strong>{{.User.Email}}</strong> </p>
                </div>
                <div class="alert alert-info" role="alert">
                    <p> İki Faktörlü Doğrulama(2FA) = <strong>{{if .User.IsOtpActive}}Aktif  <i class="bi bi-shield-fill-check"></i>{{else}}Pasif  <i class="bi bi-shield-slash-fill"></i>{{end}}</strong></p>
                </div>
                
                <div class="alert alert-warning" role="alert">
                    <i class="bi bi-exclamation-circle-fill"></i> Hesabınızın güvenliğini arttırmak için iki faktörlü doğrulamanın aktif olması önerilir.
                </div>
                <div  class="mt-3 float-start">
                    {{if .User.IsOtpActive}}
                    <a href="/admin/authinactive">
                        <button class="btn btn-warning ">Devre Dışı Bırak</button>
                    </a>
                    {{else}}
                    <a href="/admin/auth">
                        <button class="btn btn-success">Aktifleştir</button>
                    </a>
                    {{end}}
                </div>
                <div class="float-end">
                    <a href="/admin/logout">
                        <button class="btn btn-danger mt-3" type="submit">Oturumu Kapat</button>
                    </a>
                </div>
            </div>

        </div>

    </div>

    



    {{template "layout/flash.tpl" .}}

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


    <script>
        $(document).ready(function () {
            $(".toast").toast('show');
        });
    </script>

</body>

</html>