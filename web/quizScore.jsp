<%@page import="entity.Question"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entity.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="images/logo/favicon.ico">
        <link rel="stylesheet" href="styles/quiz.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Quiz Page</title>
        <style>
            input {
                width: 90%;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <div class="col-lg-3">
                    <a class="navbar-brand" href="index.php">
                        <img src="images/logo/logo.png" alt="" width="65" height="65">
                    </a>
                </div>
                <div style="text-align: center;">
                    <h1>Java Quiz App</h1>
                </div>
                <div class="col-lg-3">
                    <div class="d-flex float-end">
                        <form action="index.jsp">
                            <button class="btn btn-outline-secondary me-3" type="submit">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <br>
        <%
            Quiz quiz = (Quiz) session.getAttribute("quiz");
            String title = quiz.getQuizTitle();

            Integer correctAnswers = (Integer) session.getAttribute("correctAnswers");
            Integer questionCount = (Integer) session.getAttribute("questionCount");
            double percentage = (int) correctAnswers / (double) questionCount * 100.0;
        %>
        <br>
        <div class="container">
            <h2 class="mb-4">Score for Quiz: <%= title%></h2>


            <p>You scored <%= correctAnswers%> out of <%= questionCount %> (<%= percentage%>%)</p>

                <form action="quizResults" method="post">
                    <button type="submit">View all Quiz Results</button>
                </form>
                
                <form action="GetQuizzes" method="post">
                    <button type="submit">Back to Quizzes</button>
                </form>
                
        </div>
    </body>
</html>
