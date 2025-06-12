<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生登録</title>
</head>

<body>
<%@ include file="../header.jsp" %>
<%
        List<School> scList = (List<School>)session.getAttribute("scList");
%>
	<h2>学生登録</h2>
	<form action="input.StudentOutput.action" method="POST">
		【学籍番号】<br>
		<input type="number" name="student_id" id="student_id" required oninput="limitLength(this, 7)"><br><br>
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

		<input type="button" value="戻る" onclick="location.href='input.StudentInput.action'">
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
	  
	  function limitLength(elem, maxLength) {
	    if (elem.value.length > maxLength) {
	      elem.value = elem.value.slice(0, maxLength);
	    }
	  }
	</script>
</body>
</html>
