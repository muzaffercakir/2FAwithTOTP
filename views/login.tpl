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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        .bg-image {
            background-image: url(static/img/background.jpg);
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;

        }
    </style>

    <title>Giriş Syfası</title>
</head>

<body>


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 bg-image vh-100 mb-5 mb-md-0"></div>
            <div class="col-md-6 d-flex justify-content-center align-items-center">
                <div class="w-75">
                    <h3 class="mt-3">Hoşgeldiniz</h3>
                    <p class="mb-5">Giriş Yapmak İçin Lütfen Oturum Açın</p>
                    <form action="" method="POST">
                        <input type="hidden" name="_xsrf" value="{{ .xsrf_token }}" />
                        <div class="d-flex bg-light border mb-3 rounded-3">
                            <div class="flex-shrink-1 ps-3 align-self-center">
                                <i class="bi bi-person-fill fs-4"></i>
                            </div>
                            <div class="form-floating mb-3 flex-grow-1 pt-3 ps-1 pe-2">
                                <input type="email" id="email" name="email" value="{{.LoginForm}}" class="form-control bg-light border-0" 
                                    placeholder="name@example.com">
                                <label for="email" class="mt-3 text-center">Email</label>
                            </div>
                        </div>

                        <div class="d-flex bg-light border mb-3 rounded-3">
                            <div class="flex-shrink-1 ps-3 align-self-center">
                                <i class="bi bi-key-fill fs-3"></i>
                            </div>
                            <div class="form-floating mb-3 flex-grow-1 pt-3 ps-1 pe-2">
                                <input type="password" id="password" name="password" class="form-control bg-light border-0"
                                    placeholder="********">
                                <label for="password" class="mt-3 text-center">Şifre</label>
                            </div>
                        </div>


                        <div class="clearfix my-3"></div>
                        <div class="d-grid gap-3 py-3">
                            <input type="submit" class="btn btn-warning" value="Giriş Yap">
                        </div>

                        <p class="text-center my-3">Hesabınız yok mu? <a href="/create" class="link-primary">Kaydol</a></p>

                    </form>

                </div>
            </div>
        </div>
    </div>


    {{template "layout/flash.tpl" .}}



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    
        
    <script>
        $(document).ready(function() {
            $(".toast").toast('show');
        });
    </script>


    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>




</html>