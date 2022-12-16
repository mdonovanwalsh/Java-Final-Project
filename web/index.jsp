<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login - Java Quiz App</title>
        <link rel="icon" type="image/x-icon" href="images/logo/favicon.ico">
        <link rel="stylesheet" href="styles/login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <%
            String error = (String) session.getAttribute("Error");
            if (error == null) {
                error = "";
            }
        %>      
        <div class="container">
            <div class="logo">
                <img src="images/logo/logo.png">
            </div>
            <div class="login-box">
                <div>
                    <h3 class="mb-4">Login to Take a Quiz</h3>
                    <form action="verifyUser" method="GET">
                        <div class="mb-3">
                            <label for="usernameInput" class="form-label">User Name:</label>
                            <input id="usernameInput" type="text" class="form-control" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="passwordInput" class="form-label">Password:</label>
                            <input id="passwordInput" type="password" class="form-control" name="password" required>
                        </div>
                        <button class="btn btn-outline-secondary me-3" type="submit">Login</button>
                        <%= error %>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>