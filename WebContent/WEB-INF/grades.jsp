<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績管理</title>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
    <%@ include file="../header.jsp" %>

    <div class="container">
        <h2>成績管理メニュー</h2>
        <div class="menu-grid">
            <a href="grades.GradesRegister.action" class="menu-card">成績登録</a>
            <a href="grades.GradesList.action" class="menu-card">成績参照</a>
        </div>
        <input type="button" value="戻る" onclick="location.href='index.jsp'">
    </div>
</body>
</html>
