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
<%@ include file="../header.html" %>
<c:choose>
<c:when test="${account.access_level == 1 }">
<p><a href="subject.SubjectRegister.action">科目登録</a></p>
<p><a href="subject.SubjectList.action">科目一覧</a></p>
</c:when>
<c:when test="${account.access_level == 2 }">
<p><a href="subject.SubjectList.action">科目一覧</a></p>
</c:when>
</c:choose>
</body>
</html>