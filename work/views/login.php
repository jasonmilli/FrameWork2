<html>
    <head>
        <title>Login to FRAMEWORK</title>
        <script src='frame\jquery-1.11.3.min.js'></script>
        <script>
            $(document).ready(function() {
                $('#login-button').unbind('click').bind('click', function() {
                    $.ajax({
                        url: 'controllers/login/attempt',
                        type: 'POST',
                        data: {username: $('#login-username').val(), password: $('#login-password').val()},
                        dataType: 'json'
                    }).success(function(json) {
                        if (!json.status || json.status != 'COMPLETE') {
                            var message = json.message || 'Login failed';
                            alert(message);
                            return false;
                        }
                        location.reload;
                    }).fail(function() {
                        alert('Server error');
                    });
                });
            });
        </script>
    </head>
    <body>
        <table>
            <tr><td>Username</td><td><input type='text' id='login-username' /></td></tr>
            <tr><td>Password</td><td><input type='password' id='login-password' /></td></tr>
            <tr><td></td><td><input type='button' id='login-button' value='Login' /></td></tr>
        </table>
    </body>
</html>
