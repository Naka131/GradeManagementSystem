<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新</title>
</head>
    <%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String student_name = request.getParameter("student_name");
    String is_enrolled = request.getParameter("is_enrolled");
    %>
<body>
<%@ include file="../header.jsp" %>
	<h2>更新</h2>
	<form action="student.StudentUpdate.action" method="POST">
		<input type="hidden" name="student_id" value="<%= student_id %>" />
		<p>学籍番号:<%=student_id %></p>
		<p>氏名:<%=student_name %></p>
		<p>現在の在籍状況:<%=is_enrolled %></p>
		【在籍状況】<br>
        <select name="is_enrolled">
			<option value="在籍" selected>在籍</option>
			<option value="退学">退学 </option>
			<option value="休学" >休学</option>
			<option value="卒業">卒業</option>
		</select><br><br>

		<input type="submit" value="送信"><br><br>

		<input type="button" value="戻る" onclick="location.href='input.StudentListInput.action'">
	</form>
</body>
</html>
