<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoginAuth</title>
</head>

<body>

    <h1>Login with 2FA</h1><br>
    
    <div style="margin-top: 1em">
        (!) İki Faktörlü Doğrulama ayarınız aktif olduğu için, hesabınıza giriş yapmak için 6 haneli Doğrulama Kodunu Giriniz.
    </div>
    
    <div style="margin-top: 1em">
        <form action="" method="POST">
            <input type="hidden" name="_xsrf" value="{{ .xsrf_token }}" /> 
            
            <label class="col-md-3 form-label">2FA Key</label>
            <input type="text" class="form-control" value="" autocomplete="off" name="2fapassword">
            <button type="submit">Onayla</button>

        </form>

    </div>


    {{template "layout/flash.tpl" .}}
</body>

</html>