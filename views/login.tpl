<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>

<body>

    <h1>Login</h1><br>

    <div>
        <form action="" method="POST">
            <input type="hidden" name="_xsrf" value="{{ .xsrf_token }}" />
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" value="{{.LoginForm}}"><br>
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password"><br><br>
            <button type="submit">Giriş Yap</button> 
            
        </form>
        <a href="/create">
            <button style="margin-top: 1em;">Kaydol</button>
        </a>
    </div>


    {{template "layout/flash.tpl" .}}
</body>

</html>