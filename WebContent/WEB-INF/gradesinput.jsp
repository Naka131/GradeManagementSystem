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
<%
        List<School> scList = (List<School>)session.getAttribute("scList");
        List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
%>
	<h2>成績登録</h2>
	<form action="input.GradesOutput.action" method="POST">
		【学籍番号】<br>
		<input type="text" name="student_id" required maxlength="7"><br><br>
		【学校コード】<br>
		<select id="school_code" name="school_code" required>
		<%
		    for (School sc : scList) {
		%>
		    <option value="<%= sc.getSchool_code() %>"><%= sc.getSchool_code() %></option>
		<%
		    }
		%>
		</select><br><br>

		【クラス番号】<br>
		<select id="class_number"  name="class_number" required>
		</select><br><br>
		
		【科目名】<br>
        <select id="subject_code"  name="subject_code" required>
        <%
		    for (Subjects sj : sjList) {
		%>
		    <option value="<%= sj.getSubject_code()%>"><%= sj.getSubject_name() %></option>
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

		<input type="button" value="ホームに戻る" onclick="location.href='index.jsp'">
	</form>
	<script>
	  function limitLength(el, maxLength) {
	    if (el.value.length > maxLength) {
	      el.value = el.value.slice(0, maxLength);
	    }
	  }

	  const sc = document.getElementById("school_code");
	  const params = new URLSearchParams();
	  params.append("school_code", sc.value);
	  fetch("student.StudentGetClass.action", {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
	        },
	        body: params.toString()
	    })
	    .then(response => response.json())
	    .then(data => {
	        data.forEach(item => {
	            const opt = document.createElement("option");
	            opt.value = item.class_number;
	            opt.textContent = item.class_number;
	            cn.appendChild(opt);
	        });
	    })
	    .catch(error => {
	        console.error("Error fetching class list:", error);
	    });
	  
	  const cn = document.getElementById("class_number");
	  sc.addEventListener("change", (event) => {
		  const cl = [];
		  const params = new URLSearchParams();
		  params.append("school_code", event.target.value);
		  fetch("student.StudentGetClass.action", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		        },
		        body: params.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        cn.innerHTML = "";
		        data.forEach(item => {
		            const opt = document.createElement("option");
		            opt.value = item.class_number;
		            opt.textContent = item.class_number;
		            cn.appendChild(opt);
		        });
		    })
		    .catch(error => {
		        console.error("Error fetching class list:", error);
		    });
		});
	</script>
</body>
</html>
