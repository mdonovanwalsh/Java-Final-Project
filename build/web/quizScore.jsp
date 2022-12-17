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
        <!--<script src="scripts/progressBar.js"></script>-->
        <link rel="stylesheet" href="styles/quiz.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Quiz Page</title>
    </head>
    <body>
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <div class="col-lg-3">
                    <a class="navbar-brand" href="homePage.jsp">
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
            
            // Progress Bar Colour
            String progressBar = "";
            if (percentage <= 59.9) {
                progressBar = "w3-red";
            } else {
                progressBar = "w3-green";
            }
        %>
        <br>
        <div class="container">
            <h2 class="mb-4">Score for Quiz: <%= title%></h2>
            <div class="row" style="margin-bottom:2em;">
                <div class="col-lg-3 col-md-3">
                    <p>You scored <%= correctAnswers%> out of <%= questionCount %> (<%= percentage%>%)</p>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="progress">
                        <div class="w3-container <%= progressBar %> w3-round-xlarge" id="progressBar" style="width:0%;">0%</div>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <form action="quizResults" method="POST">
                            <button class="btn btn-outline-secondary" type="submit" style="width:100%;">View all Quiz Results</button>
                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <form action="GetQuizzes" method="POST">
                            <button class="btn btn-outline-secondary" type="submit" style="width:100%;">Back to Quizzes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        /*
         * Progress Bar Animation was created and designed by W3Schools
         */
        window.onload = function () {
            progressBarAnimation();
        };
        
        function progressBarAnimation() {
            var elem = document.getElementById("progressBar");   
            var width = 0;
            var id = setInterval(frame, 20);
            function frame() {
                if (width >= <%= percentage%>) {
                    clearInterval(id);
                } else {
                    width++; 
                    elem.style.width = width + '%'; 
                    elem.innerHTML = width * 1  + '%';
                }
            }
        }
    </script>
</html>
