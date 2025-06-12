<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
<form action="account.AccountSearch.action" method="post">
ユーザーID：<input type="text" name="teacher_id" required><br>
パスワード：<input type="password" name="password" required><br>
<input type="submit" value="ログイン"><br>
<a href="input.AccountRegisterInput.action">新規登録</a>
</form>
 <c:if test="${not empty errorMsg}">
        <p style="color:red;">${errorMsg}</p>
</c:if>
</body>
</html>