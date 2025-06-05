<%@page import="bean.Students"%>
<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目管理</title>
</head>
<body>
<c:choose>
<c:when test="${account.access_level == 1 }">
<p><a href="subject.SubjectsRegister.action">科目登録</a></p>
<p><a href="subject.SubjectsList.action">科目一覧</a></p>
</c:when>
<c:when test="${account.access_level == 2 }">
<p><a href="subject.SubjectsList.action">科目一覧</a></p>
</c:when>
</c:choose>
<input type="button" value="ホームに戻る" onclick="location.href='index.jsp'">
</body>
</html>