<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kaydol</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>

<body>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h1 class="card-title text-primary">Hesap Oluştur</h1>
                    </div>
                    <div class="card-body">
                        <form class="form-horizontal" method="POST">
                            <input type="hidden" name="_xsrf" value="{{.xsrf_token}}" />
                            <div class=" row mb-4">
                                <label class="col-md-3 form-label">Email</label>
                                <div class="col-md-9">
                                    <input type="email" class="form-control" value="{{.SignUpForm.Email}}" name="email">
                                </div>
                            </div>
                            <div class=" row mb-4">
                                <label class="col-md-3 form-label">Şifre</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" value="" autocomplete="off"
                                        name="password">
                                </div>
                            </div>
                            <div class=" row mb-4">
                                <label class="col-md-3 form-label">Şifre (Tekrar)</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" value="" autocomplete="off"
                                        name="repassword">
                                </div>
                            </div>

                            <div class="alert alert-warning" role="alert">
                                <i class="bi bi-exclamation-circle-fill"></i>   İlk kez kayıt olurken İki Faktörlü Doğrulama Pasif olarak ayarlanacaktır.
                            </div>

                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-success" style="margin-top: 1em;">Kaydol</button>
                            </div>


                        </form>
                    </div>
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