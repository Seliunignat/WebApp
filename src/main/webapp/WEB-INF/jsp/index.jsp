<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
  <head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  </head>
  <body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <div>
      <!--<h3 style="font-size: 36px; font-family: Arial, Helvetica, sans-serif; color: green;">${pageContext.request.userPrincipal.name}</h3>-->
      <sec:authorize access="!isAuthenticated()">
        <%response.sendRedirect("/login"); %>
        <div class="d-grid gap-2 col-6 mx-auto">
          <a class="btn btn-primary" href="/login" role="button">Войти</a>
          <a class="btn btn-primary" href="/registration" role="button">Зарегистрироваться</a>
        </div>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
        <%response.sendRedirect("/admin");%>
        <h4><a href="/logout">Выйти</a></h4>
      </sec:authorize>
    </div>
  </body>
</html>