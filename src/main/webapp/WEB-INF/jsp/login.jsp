<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="../../resources/css/login.css">
  <title>LOG IN</title>
</head>

<body class="bg">
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/admin"); %>
</sec:authorize>
<section class="container-fluid">
  <section class="row justify-content-center">
    <section class="col-12 col-sm-10 col-md-6">
      <form action="/login" class="form-container" method="post" >
        <div class="container my-auto">
          <h2 align="center">Please sign in</h2>
          <div class="col-sm-6 mb-2 mx-auto">
            <label class="form-label">Username</label>
            <input name="username" type="text" class="form-control" aria-describedby="emailHelp">
          </div>
          <div class="col-sm-6 mb-2 mx-auto">
            <label class="form-label">Password</label>
            <input name="password" class="form-control" type="password">
          </div>
          <div class="col-sm-6 mx-auto">
            <button class="btn btn-primary" type="submit" >Sign In</button>
            <a class="btn btn-outline-primary" href="/registration" role="button">Registration</a>
          </div>
        </div>
      <!--<br><a href="/">Главная</a>-->
      </form>
    </section>
  </section>
</section>
  <!------------------------------------------------------------>

  <!------------------------------------------------------------>

</body>
</html>
