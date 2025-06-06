<%@page import="bean.Subjects"%>
<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成績登録</title>
</head>

<body>
<%@ include file="../header.html" %>
<%
        List<Students> stList = (List<Students>)session.getAttribute("stList");
        List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
%>
	<h2>成績登録</h2>
	<form action="input.GradesOutput.action" method="POST">
		【学籍番号】<br>
		<input list="stlist" id="student_id" name="student_id" required maxlength="10" autocomplete="off" >
		<datalist id="stlist">
		<% for (Students st : stList) {
		%> <option value="<%= st.getStudent_id() %>"><%= st.getStudent_id() %></option>
		<% } %>
		</datalist>
		<br><br>
		【学校コード】<br>	
	     <input type="text" id="school_code" name="school_code" readonly>	<br><br>
		【クラス番号】<br>
	     <input type="text" id="class_number" name="class_number" readonly>	<br><br>
		【科目名】<br>
        <select id="subject_name"  name="subject_name" required>
        <%
		    for (Subjects sj : sjList) {
		%>
		    <option value="<%= sj.getSubject_name()%>"><%= sj.getSubject_name() %></option>
		<%
		    }
		%>
		</select><br><br>

		【回数】<br>
		 <select name="attempt_number">
			<option value="1"selected>1</option>
			<option value="2">2</option>
		</select><br><br>
        
		【点数】<br>
		<input type="number" name="score" min="0" max="100" step="1" required
		  oninput="this.value = 
		    this.value > 100 ? 100 : 
		    this.value < 0 ? 0 : this.value">
		<br><br>


		<input type="submit" value="登録"><br><br>

		<input type="button" value="戻る" onclick="location.href='input.GradesInput.action'">
	</form>
	<script>
	  function limitLength(el, maxLength) {
	    if (el.value.length > maxLength) {
	      el.value = el.value.slice(0, maxLength);
	    }
	  }
	  
	  const st = document.getElementById("student_id");
	  const sc = document.getElementById("school_code");
	  const cn = document.getElementById("class_number");
	  st.addEventListener("blur", (event) => {
		  const params = new URLSearchParams();
		  params.append("student_id", event.target.value);
		  fetch("grades.GradesGetStudentData.action", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		        },
		        body: params.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        data.forEach(item => {
		        	sc.value = item.school_code;
		        	cn.value = item.class_number;
		        });
		    })
		    .catch(error => {
		        console.error("Error fetching class list:", error);
		    });
		});
	</script>
</body>
</html>
