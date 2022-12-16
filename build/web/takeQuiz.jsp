<%@page import="entity.Question"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entity.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Quiz Page</title>
        <style>
            input {
                width: 90%;
            }
        </style>
    </head>
    <body>
        <%
            Quiz quiz = (Quiz) session.getAttribute("quiz");
            String title = quiz.getQuizTitle();

            List<Question> questions = (List<Question>) session.getAttribute("questions");
        %>
        <br>
        <div class="container">
            <form action="index.jsp">

                <button class="btn btn-outline-secondary me-3" type="submit">Logout</button><br><br>
            </form>
            <h2 class="mb-4"><%= title%></h2>



            <c:forEach items="${questions}" var="temp">
                <p>${temp.questionText}</p>
                <c:forEach items="${temp.choices}" var = "tempChoice">
                    <input type="radio" name="${temp.questionID}" value="${tempChoice}">${tempChoice}
                </c:forEach>
            </c:forEach>

        </div>
    </body>
</html>
