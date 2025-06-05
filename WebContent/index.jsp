<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページ</title>
</head>
<body>
<c:choose>
<c:when test="${account.access_level == 1 }">
<h2>管理者ページ</h2>
<p><a href="input.StudentsInput.action">学生管理</a></p>
<p><a href="input.GradesInput.action">成績管理</a></p>
<p><a href="input.SubjectInput.action">科目管理</a></p>
<p><a href="input.RegisterInput.action">ユーザー登録</a></p>
<p><a href="account.Logout.action"><button type="button" >ログアウト</button></a></p>
</c:when>
<c:when test="${account.access_level == 2 }">
<h2>教員ページ</h2>
<p><a href="input.StudentsInput.action">学生管理</a></p>
<p><a href="input.GradesInput.action">成績管理</a></p>
<p><a href="input.SubjectInput.action">科目管理</a></p>
<p><a href="account.Logout.action"><button type="button" >ログアウト</button></a></p>
</c:when>
</c:choose>
</body>
</html>