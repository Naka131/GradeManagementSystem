<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目管理</title>
    <link rel="stylesheet" href="css/menu.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2>科目管理メニュー</h2>

    <div class="menu-grid">
        <c:choose>
            <c:when test="${account.access_level == 1}">
                <a href="input.SubjectRegisterInput.action" class="menu-card">科目登録</a>
                <a href="subject.SubjectList.action" class="menu-card">科目一覧</a>
            </c:when>
            <c:when test="${account.access_level == 2}">
                <a href="subject.SubjectList.action" class="menu-card">科目一覧</a>
            </c:when>
        </c:choose>
    </div>
</div>

</body>
</html>
