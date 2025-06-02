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
    String subject_code = request.getParameter("subject_code");
    String subject_name = request.getParameter("subject_name");
    %>
<body>
	<h2>更新</h2>
	<form action="subject.SubjectUpdate.action" method="POST">
		<input type="hidden" name="subject_code" value="<%= subject_code %>" />
		【科目コード】<br>
		<input type="text" name="update_subject_code" value="<%= subject_code %>" /><br><br>
		【科目名】<br>
		<input type="text" name="subject_name" value="<%= subject_name %>" /><br><br>

		<input type="submit" value="更新"><br><br>

		<input type="button" value="ホームに戻る" onclick="history.back()">
	</form>
</body>
</html>
