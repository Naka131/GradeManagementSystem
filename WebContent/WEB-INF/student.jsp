<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
    <%@ include file="../header.jsp" %>

    <div class="container">
        <h2>学生管理メニュー</h2>
        <div class="menu-grid">
            <c:if test="${account.access_level == 1}">
                <a href="student.StudentRegister.action" class="menu-card">学生登録</a>
            </c:if>
            <a href="student.Student.action" class="menu-card">学生一覧</a>
        </div>
        <input type="button" value="戻る" onclick="location.href='index.jsp'">
    </div>
</body>
</html>
