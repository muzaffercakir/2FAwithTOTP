<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kaydol</title>
</head>

<body>

    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Sign Up</h1>
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
                    <label class="col-md-3 form-label">Password</label>
                    <div class="col-md-9">
                        <input type="password" class="form-control" value="" autocomplete="off" name="password">
                    </div>
                </div>
                <div class=" row mb-4"> 
                    <label class="col-md-3 form-label">Repassword</label>
                    <div class="col-md-9"> 
                        <input type="password" class="form-control" value="" autocomplete="off"
                            name="repassword">
                    </div>
                </div>

                <div style="margin-top: 1em">
                    (!) İlk kez kayıt olurken İki Faktörlü Doğrulama Pasif olarak ayarlanacaktır.
                </div>

                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-success" style="margin-top: 1em;">Kaydol</button>
                </div>
                
                
            </form>
        </div>
    </div>

    {{template "layout/flash.tpl" .}}
</body>

</html>