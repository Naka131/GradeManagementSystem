<%@page import="bean.School"%>
<%@page import="bean.Grades"%>
<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>成績参照</title>
</head>
<body>
    <h1>一覧</h1>
    <%
        List<School> scList = (List<School>)session.getAttribute("scList");
        List<Grades> grList = (List<Grades>)session.getAttribute("grList");
        if (grList != null && !grList.isEmpty()) {
    %>
    <input type="text" id="searchword" placeholder="検索">
    <table border="1">
        <thead>
            <tr>
                <th>学籍番号</th>
                <th>氏名</th>
                <th>学校コード</th>
                <th>クラス番号</th>
                <th>科目名</th>
                <th>回数</th>
                <th>点数</th>
            </tr>
        </thead>
        <tbody id="grades">
            <%
                for (Grades gr : grList) {
            %>
            <tr>
                <td><%= gr.getStudent_id() %></td>
                <td><%= gr.getStudent_name() %></td>
                <td><%= gr.getSchool_code() %></td>
                <td><%= gr.getClass_number() %></td>
                <td><%= gr.getSubject_name() %></td>
                <td><%= gr.getAttempt_number() %></td>
                <td><%= gr.getScore() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        } else{
     %>
     <p>登録されていません</p>
     <%
        }
    %>
    <a href="index.jsp">ホームへ</a>
<script>
    const sc = document.getElementById("searchword");
    const grades = document.getElementById("grades");
	sc.addEventListener("change", (event) => {
		const params = new URLSearchParams();
		const cl =[];
		params.append("keyword", event.target.value);
		fetch("grades.GradesSearch.action", {
		      method: 'POST',
		      headers: {
		          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		      },
		      body: params.toString()
		  })
		  .then(response => response.json())
		  .then(data => {
			  grades.innerHTML = "";
			  console.log("a")
		      data.forEach(item => {
	            cl.push(`<tr>
	                <td>\${item.student_id}</td>
	                <td>\${item.student_name}</td>
	                <td>\${item.school_code}</td>
	                <td>\${item.class_number}</td>
	                <td>\${item.subject_name}</td>
	                <td>\${item.attempt_number}</td>
	                <td>\${item.score}</td>
	            </tr>`)
		      });
			  grades.innerHTML = cl.join("");
		  })
		  .catch(error => {
		      console.error("Error fetching class list:", error);
		  });

	})
</script>
</body>
</html>