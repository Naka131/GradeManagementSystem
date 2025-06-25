<%@page import="bean.School"%>
<%@page import="bean.Class"%>
<%@page import="java.util.*, bean.Students"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生更新</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String student_name = request.getParameter("student_name");
    String is_enrolled = request.getParameter("is_enrolled");
%>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2>学生情報更新</h2>

    <form action="student.StudentUpdate.action" method="POST" class="form">
        <input type="hidden" name="student_id" value="<%= student_id %>" />

        <div class="form-group">
            <label>学籍番号:</label>
            <strong><%= student_id %></strong>
        </div>

        <div class="form-group">
            <label>氏名:</label>
            <strong><%= student_name %></strong>
        </div>

        <div class="form-group">
            <label>現在の在籍状況:</label>
            <strong><%= is_enrolled %></strong>
        </div>

        <div class="form-group">
            <label>【新しい在籍状況】</label>
            <select name="is_enrolled">
                <option value="在籍" selected>在籍</option>
                <option value="退学">退学 </option>
                <option value="休学">休学</option>
                <option value="卒業">卒業</option>
            </select>
        </div>

        <div class="form-buttons">
            <input type="submit" value="更新"><br><br>
            <input type="button" value="戻る" onclick="location.href='input.StudentListInput.action'">
        </div>
    </form>
</div>

</body>
</html>
