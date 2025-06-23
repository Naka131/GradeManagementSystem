<%@ page import="bean.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理システム</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
<c:choose>
<c:when test="${account.access_level == 1 }">
    <h2>管理者ページ</h2>
    <div class="menu-grid">
        <a href="input.StudentInput.action" class="menu-card" tabindex="0">
            学生管理
        </a>
        <a href="input.GradesInput.action" class="menu-card" tabindex="0">
            成績管理
        </a>
        <a href="input.SubjectInput.action" class="menu-card" tabindex="0">
            科目管理
        </a>
        <a href="input.RegisterInput.action" class="menu-card" tabindex="0">
            ユーザー管理
        </a>
    </div>
</c:when>
<c:when test="${account.access_level == 2 }">
    <h2>教員ページ</h2>
    <div class="menu-grid">
        <a href="input.StudentInput.action" class="menu-card" tabindex="0">
            学生管理
        </a>
        <a href="input.GradesInput.action" class="menu-card" tabindex="0">
            成績管理
        </a>
        <a href="input.SubjectInput.action" class="menu-card" tabindex="0">
            科目管理
        </a>
    </div>
</c:when>
</c:choose>
</div>
</body>
</html>
