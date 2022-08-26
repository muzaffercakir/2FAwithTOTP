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

    <title>LoginAuth</title>
</head>

<body>
    <div class="container">
        <h1 class="mt-3">İki Faktörlü Doğrulama ile Login Ekranı</h1>
        <div class="row mt-2">
            <div class="col-md-6">
                <p><i class="bi bi-person-fill fs-4"></i> {{.CreateAuth.Email}}</p>
            </div>
            <div class="col-md-6">
                <i class="bi bi-lock-fill fs-4"></i> İki Faktörlü Doğrulama(2FA) = <strong>{{if .User.IsOtpActive}}Aktif <i class="bi bi-shield-fill-check"></i> {{else}}Pasif <i class="bi bi-shield-slash-fill"></i>{{end}}</strong>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-6">
                <div class="card" style="width: 28rem;">
                    <div class=" card-body alert alert-secondary py-1 mt-3" role="alert">
                        <i class="bi bi-key-fill fs-5"></i> Yetkilendirme İstemcinizi(Google Authenticator v.b)
                        ayarlamak için kullanabileceğiniz kurulum anahtarınız :
                    </div>
                    <div class="card-title text-center py-1 mb-3">
                        {{if .TotpCheckFlag}}
                        <strong class="alert alert-info py-2 mb-3" role="alert">{{.TempSecretKey}}</strong>
                        {{else}}
                        <strong class="alert alert-info py-2 mb-3" role="alert">{{.SecretKey}}</strong>
                        {{end}}
                    </div>

                </div>
                <div class="mt-1">
                    <form action="" method="POST">
                        <input type="hidden" name="_xsrf" value="{{ .xsrf_token }}" />
                        <div class="alert alert-warning " role="alert" style="margin-top: 1em; margin-bottom: 1em">
                            <i class="bi bi-exclamation-circle-fill me-1"></i> Yetkilendirme İstemciniz ile eşleştirmeyi yaptıysanız 6 haneli Tek Kullanımlık Şifreyi
                            giriniz:
                        </div>
                        <div class="input-group input-group-sm mb-3">
                            <span class="input-group-text" id="inputGroup-sizing-sm"><i class="bi bi-key-fill fs-5 px-2"></i></span>
                            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="Tek Kullanımlık Şifre" name="2fapassword">
                          </div>
                          <button class="btn btn-success float-end mt-1" type="submit">Onayla</button>
                        
                    </form>
                </div>
            </div>
            <div class="col-md-6 card">
                <div class="alert alert-primary py-2 mt-3" role="alert">
                    <i class="bi bi-exclamation-circle-fill me-1"></i> Kurulum anahtarını manuel olarak girmek
                    istemiyorsanız aşağıdaki QR Kodu okutun.
                </div>
                <div class="card" style="width: 15rem; margin-left: 6rem;">
                    <img src="/static/img/qrcode.png" class="card-img-top text-white" alt="QR Code Barkod">
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