<%@ page import="java.util.ArrayList" %>
<%@ page import="com.boots.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="../../resources/css/login.css">
  <title>Log in with your account</title>
</head>



<body>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<div>
  <div class="container">
    <div class="row">
      <div class="col align-self-md-end">
        <h2 class="text-right" style="font-size: 70px; font-family: Arial, Helvetica, sans-serif; color: black;">Hello, </h2>
      </div>
      <div class="col">
        <h2 class="align-content-md-start" style="font-size: 70px; font-family: Arial, Helvetica, sans-serif; color: #5c5cff;">${pageContext.request.userPrincipal.name}!</h2>
      </div>
    </div>
  </div>
  <table class="table-bordered mx-2">
    <form action="${pageContext.request.contextPath}/admin" method="post">
      <div class="row ml-3 mb-1">
        <div class="mr-1">
          <button class="btn btn-dark" type="submit" name="action" value="block">Block</button>
        </div>
        <div class="mr-1">
          <button class="btn btn-primary" type="submit" name="action" value="unblock">UnBlock</button>
        </div>
        <div class="mr-0">
          <button class="btn btn-outline-danger" type="submit" name="action" value="delete">Delete</button>
        </div>
      </div>
      <thead>
        <tr>
          <th scope="col"></th>
          <th scope="col">ID</th>
          <th scope="col">UserName</th>
          <th scope="col">Password</th>
          <th scope="col">Mail</th>
          <th scope="col">regDate</th>
          <th scope="col">lastLogDate</th>
          <th scope="col">Roles</th>
        </tr>
      </thead>
    <c:forEach items="${allUsers}" var="user">
      <tbody>
        <tr>
          <td><input type="checkbox" name="isSelected" value="${user.id}"></td>
          <td>${user.id}</td>
          <td>${user.username}</td>
          <td>${user.password}</td>
          <td>${user.mail}</td>
          <td>${user.regDate}</td>
          <td>${user.logDate}</td>
          <td>
            <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
          </td>
        </tr>
      </tbody>
    </c:forEach>
  </table>

  </form>

</div>
<div class="row mt-3">
  <div class="col">
  </div>
  <div class="col col-2 mx-auto">
    <a class="btn btn-outline-primary btn-block" href="/logout">Выйти</a>
  </div>
  <div class="col">
  </div>

</div>

</body>
</html>