<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entity.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="images/logo/favicon.ico">
        <link rel="stylesheet" href="styles/home-page.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Home Page - Java Quiz App</title>
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
        <div class="container">
            <h2 class="mb-4">Welcome to the Quiz Application!</h2>
            <form action="GetQuizzes">
                <div class="form-floating input-group">
                    <input type="text" name="searchKey" class="form-control floatingSelectGrid"></input>
                    <label for="floatingSelectGrid" style="text-decoration: underline;">Enter a full or partial quiz title! | Leave blank to see all | Case-insensitive</label>
                    <button name="searchButton" value="clicked" class="btn btn-outline-secondary" required>Search</button>
                </div>
            </form>
            <br>
        </div>
        <div class="container">
            <h4>Select a Quiz!</h4>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach items="${theQuizzes}" var="temp">
                <div class="col">
                    <div class="card border-dark" id="questionCard">
                        <div class="card-header">
                            <div class="tag-colour"></div>
                            <h5 class="card-title">${temp.getQuizTitle()}</h5>
                            <h6 class="card-subtitle text-secondary float-end">Number of Questions: <span>NULL</span></h6>
                            <h6 class="card-subtitle text-secondary float-end">Number of Points: <span>NULL</span></h6>
                        </div>
                        <div class="card-body text-center">
                            <form action="buildQuiz" method="GET">
                                <button type="submit" name="quizID" class="btn btn-outline-primary" value="${temp.getQuizId()}" style="width: 100%;">Take Quiz!</button>
                            </form>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
