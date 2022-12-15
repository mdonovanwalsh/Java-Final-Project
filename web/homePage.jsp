<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entity.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Home Page</title>
    </head>
    <body>
        <br>
        <div class="container">
            <form action="index.html">

                <button class="btn btn-outline-secondary me-3" type="submit">Logout</button><br><br>
            </form>
            <h2 class="mb-4">Welcome to the Quiz Application!</h2>

            <table class="table table-light table-bordered">
                <tr><th>ID</th><th>Quiz Title</th></tr>
                        <c:forEach items="${allQuizzes}" var="temp">
                    <tr>
                        <td>${temp.quizID}</td>
                        <td>${temp.quizTitle}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
