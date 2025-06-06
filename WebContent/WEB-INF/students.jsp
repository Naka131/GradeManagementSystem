<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:choose>
<c:when test="${account.access_level == 1 }">
<p><a href="student.StudentsRegister.action">学生登録</a></p>
<p><a href="student.Students.action">学生一覧</a></p>
</c:when>
<c:when test="${account.access_level == 2 }">
<p><a href="student.Students.action">学生一覧</a></p>
</c:when>
</c:choose>
</body>
</html>