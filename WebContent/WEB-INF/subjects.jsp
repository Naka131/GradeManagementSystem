<%@page import="bean.Students"%>
<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
</head>
<body>
<p><a href="subject.SubjectsRegister.action">科目登録</a></p>
<p><a href="subject.SubjectsList.action">科目一覧</a></p>
<input type="button" value="戻る" onclick="history.back()">
</body>
</html>