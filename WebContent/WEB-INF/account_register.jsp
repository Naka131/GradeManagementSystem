<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="bean.School"%>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<School> scList = (List<School>)session.getAttribute("scList");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>新規登録</title>
  <link rel="stylesheet" href="css/table.css">
  <link rel="stylesheet" href="css/form.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
  <h2>新規登録</h2>

  <form action="account.AccountRegister.action" method="post">
    
    <div class="form-group">
      <label><input type="radio" name="access_level" value="1"> 管理者で登録する</label>
      <label><input type="radio" name="access_level" value="2" checked> ユーザーで登録する</label>
    </div>

    <div class="form-group">
      <label>【名前】</label>
      <input type="text" name="teacher_name" required>
    </div>

    <div class="form-group">
      <label>【ユーザーID】</label>
      <input type="text" name="teacher_id" required>
    </div>

    <div class="form-group">
      <label>【パスワード】</label>
      <input type="password" name="password" required>
    </div>

    <div class="form-group">
      <label>【学校コード】</label>
      <select id="school_code" name="school_code" required>
        <% for (School sc : scList) { %>
          <option value="<%= sc.getSchool_code() %>"><%= sc.getSchool_code() %></option>
        <% } %>
      </select>
    </div>

    <div class="form-buttons">
      <input type="submit" value="登録">
      <c:choose>
        <c:when test="${account.access_level == 1}">
          <input type="button" value="戻る" onclick="location.href='input.RegisterInput.action'">
        </c:when>
        <c:otherwise>
          <input type="button" value="戻る" onclick="location.href='input.LoginInput.action'">
        </c:otherwise>
      </c:choose>
    </div>
  </form>
</div>

</body>
</html>
