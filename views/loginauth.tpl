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

    <h3 class="text-center mt-5">2FA Tek Kullanımlık Şifre</h3>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-warning mt-3" role="alert">
                    <i class="bi bi-exclamation-circle-fill me-1"></i> İki Faktörlü Doğrulama ayarınız aktif olduğu için,
                    hesabınıza giriş yapmak için 6 haneli Doğrulama
                    Kodunu Giriniz.
                </div>  
            </div>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-md-6" style="margin-top: 1em">
                <form action="" method="POST">
                    <input type="hidden" name="_xsrf" value="{{ .xsrf_token }}" />
                    <div class="input-group input-group-sm mb-3 text-center">
                        <span class="input-group-text" id="inputGroup-sizing-sm"><i
                                class="bi bi-key-fill fs-5 px-2"></i></span>
                        <input type="text" class="form-control me-5" aria-label="Sizing example input"
                            aria-describedby="inputGroup-sizing-sm" placeholder="Tek Kullanımlık Şifre"
                            name="2fapassword">
                        <button class="btn btn-success mt-1  px-3 rounded-1" type="submit">Onayla</button>

                    </div>

                </form>

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