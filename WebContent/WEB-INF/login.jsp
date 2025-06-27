<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ログイン画面</title>
  <link rel="stylesheet" href="css/form.css">
<body>
  <div class="container">
    <h2>ログイン</h2>
    <form action="account.AccountSearch.action" method="post">

      <div class="form-group">
        <label for="teacher_id">ユーザーID：</label>
        <input type="text" id="teacher_id" name="teacher_id" required>
      </div>

      <div class="form-group">
        <label for="password">パスワード：</label>
        <input type="password" id="password" name="password" required>
      </div>

      <div class="form-buttons">
        <input type="submit" value="ログイン">
        <a href="input.AccountRegisterInput.action">新規登録</a>
      </div>

      <c:if test="${not empty errorMsg}">
        <p style="color:red; text-align:center;">${errorMsg}</p>
      </c:if>
    </form>
  </div>
</body>
</html>
