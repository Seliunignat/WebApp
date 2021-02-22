<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <title>Регистрация</title>
</head>

<body>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<div>
  <div class="row mt-3 mb-3">
    <div class="col">
    </div>
    <div class="col">
      <h2 class="text-center" style="font-size: 70px; font-family: Arial, Helvetica, sans-serif; color: black;">Registration</h2>
    </div>
    <div class="col">
    </div>
  </div>
  <form:form method="POST" modelAttribute="userForm">
    <div class="row mb-1 mx-auto">
      <div class="col">
      </div>
      <div class="col-3">
      <form:input name="username" class="form-control" type="text" path="username" placeholder="Username" autofocus="true"></form:input>
      <form:errors path="username"></form:errors>${usernameError}
      </div>
      <div class="col">
      </div>
    </div>
    <div class="row mb-1 mx-auto">
      <div class="col">
      </div>
      <div class="col-3">
      <form:input name="mail" class="form-control" type="text" path="mail" placeholder="Mail" autofocus="true"></form:input>
      <form:errors path="mail"></form:errors>${mailError}
      </div>
      <div class="col">
      </div>
    </div>
    <div class="row mb-1 mx-auto">
      <div class="col">
      </div>
      <div class="col-3">
        <form:input name="password" class="form-control" type="password" path="password" placeholder="Password"></form:input>
      </div>
      <div class="col">
      </div>
    </div>
    <div class="row mb-1 mx-auto">
      <div class="col">
      </div>
      <div class="col-3">
      <form:input name="passwordConfirm" class="form-control" type="password" path="passwordConfirm" placeholder="Confirm your password"></form:input>
      <form:errors path="password"></form:errors>${passwordError}
      </div>
      <div class="col">
      </div>
    </div>
    <div class="row mt-2 mx-auto">
      <div class="col">
      </div>
      <div class="col-2 mx-auto">
      <button class="btn btn-primary btn-block" type="submit">Зарегистрироваться</button>
      </div>
      <div class="col">
      </div>
    </div>
  </form:form>
  <div class="row mt-1">
    <div class="col mx-auto">
    </div>
    <div class="col-1">
      <a href="/login" class="btn btn-primary">Назад</a>
    </div>
    <div class="col mx-auto">
    </div>
  </div>
</div>
</body>
</html>