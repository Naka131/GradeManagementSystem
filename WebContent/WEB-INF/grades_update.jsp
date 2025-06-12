<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<%@page import="bean.Subjects"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新</title>
</head>
    <%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
    String student_id = request.getParameter("student_id");
    int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
    List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
    %>
<body>
<%@ include file="../header.jsp" %>
	<h2>更新</h2>
	<form action="grades.GradesUpdate.action" method="POST">
		<input type="hidden" name="subject_code" value="<%= subject_code %>" />
		<input type="hidden" name="student_id" value="<%= student_id %>" />
		<input type="hidden" name="attempt_number" value="<%= attempt_number %>" />

		【科目名】<br>
        <select id="subject_code"  name="update_subject_code" required>
        <%
		    for (Subjects sj : sjList) {
		%>
		    <option value="<%= sj.getSubject_code()%>"><%= sj.getSubject_name() %></option>
		<%
		    }
		%>
		</select><br><br>

		【回数】<br>
		 <select name="update_attempt_number">
			<option value="1"selected>1</option>
			<option value="2">2</option>
		</select><br><br>

		【点数】<br>
		<input type="number" name="update_score" min="0" max="100" step="1" required
		  oninput="this.value =
		    this.value > 100 ? 100 :
		    this.value < 0 ? 0 : this.value">
		<br><br>

		<input type="submit" value="更新"><br><br>

		<input type="button" value="戻る" onclick="location.href='input.GradesListInput.action'">
	</form>
</body>
</html>
