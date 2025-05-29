<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書籍管理システム</title>
</head>

<body>
<%
        List<School> scList = (List<School>)session.getAttribute("scList");
        List<Class> cList = (List<Class>)session.getAttribute("cList");
%>
	<h2>書籍管理システム</h2>
	<form action="input.Output.action" method="POST">
		【学籍番号】<br>
		<input type="text" name="student_id" required maxlength="10"><br><br>
		【学校コード】<br>
		<select name="school_code" required>
		<%
		    for (School sc : scList) {
		%>
		    <option value="<%= sc.getSchool_code() %>"><%= sc.getSchool_code() %></option>
		<%
		    }
		%>
		</select><br><br>
		
		【クラス番号】<br>
		<select name="class_number" required>
		<%
		    for (Class c : cList) {
		%>
		    <option value="<%= c.getClass_number() %>"><%= c.getClass_number() %></option>
		<%
		    }
		%>
		</select><br><br>
		【氏名】<br>
        <input type="text" id="text" name="student_name" required><br><br>
        
		【入学年度】<br>
        <input type="number" id="text" name="enrollment_year" required oninput="limitLength(this, 4)"><br><br>
        
		【在籍状況】<br>
        <select name="is_enrolled">
			<option value="在籍"selected>在籍</option>
			<option value="退学">退学 </option>
			<option value="休学">休学</option>
			<option value="卒業">卒業</option>
		</select><br><br>

		<input type="submit" value="登録"><br><br>

		<input type="button" value="ホームに戻る" onclick="location.href='index.jsp'">
	</form>
	<script>
	  function limitLength(el, maxLength) {
	    if (el.value.length > maxLength) {
	      el.value = el.value.slice(0, maxLength);
	    }
	  }
	</script>
</body>
</html>
