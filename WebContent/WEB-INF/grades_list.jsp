<%@page import="bean.Subjects"%>
<%@page import="bean.School"%>
<%@page import="bean.Grades"%>
<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>成績参照</title>
</head>
<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="css/sortArrow.css">
<body>
<%@ include file="../header.jsp" %>
    <h1>成績一覧</h1>
    <%
        List<School> scList = (List<School>)session.getAttribute("scList");
        List<Grades> grList = (List<Grades>)session.getAttribute("grList");
        List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
        if (grList != null && !grList.isEmpty()) {
    %>
    【学籍番号検索】<input type="text" id="student_id" class="searchword" placeholder="学籍番号検索"><br>
    【学校コード】
    <select id="searchschool" name="searchschool">
    	<option value="">選択してください</option>
    	<%
		    for (School sc : scList) {
		%>
		    <option value="<%= sc.getSchool_code() %>"><%= sc.getSchool_code() %></option>
		<%
		    }
		%>
    </select><br>
    【クラス番号】
	<select id="class_number"  class="search" name="class_number">
		<option value="">選択してください</option>
	</select><br>
	【科目名】
        <select id="subject_name"  name="subject_name"  class="search">
        	<option value="">選択してください</option>
        <%
		    for (Subjects sj : sjList) {
		%>
		    <option value="<%= sj.getSubject_name()%>"><%= sj.getSubject_name() %></option>
		<%
		    }
		%>
		</select><br>
	【回数】
		 <select id="attempt_number" name="attempt_number" class="search">
		 	<option value="">選択してください</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select><br>
    【氏名検索】<input type="text" id="searchname" class="searchword" placeholder="氏名検索"><button id="reset">リセット</button>
    <table border="1">
        <thead>
            <tr>
                <th id="0" class="sort">学籍番号</th>
                <th id="1">氏名</th>
                <th id="2">学校コード</th>
                <th id="3">クラス番号</th>
                <th id="4">科目名</th>
                <th id="5">回数</th>
                <th id="6" class="sort">点数</th>
            </tr>
        </thead>
        <tbody id="gradesData">
            <%
                for (Grades gr : grList) {
            %>
            <tr class="grades">
                <td><%= gr.getStudent_id() %></td>
                <td><%= gr.getStudent_name() %></td>
                <td><%= gr.getSchool_code() %></td>
                <td><%= gr.getClass_number() %></td>
                <td><%= gr.getSubject_name() %></td>
                <td><%= gr.getAttempt_number() %></td>
                <td><%= gr.getScore() %></td>
                <c:if test="${account.access_level == 1}">
                            <td>
                                <form method="post" action="grades.GradesDelete.action" style="display:inline;">
                                    <input type="hidden" name="student_id" value="<%= gr.getStudent_id() %>" />
                                    <input type="hidden" name="subject_code" value="<%= gr.getSubject_code() %>" />
                                    <input type="hidden" name="attempt_number" value="<%= gr.getAttempt_number() %>" />
                                    <input type="submit" value="削除" />
                                </form>
                                <form method="post" action="input.GradesUpdateInput.action" style="display:inline;">
                                    <input type="hidden" name="student_id" value="<%= gr.getStudent_id() %>" />
                                    <input type="hidden" name="subject_code" value="<%= gr.getSubject_code() %>" />
                                    <input type="hidden" name="attempt_number" value="<%= gr.getAttempt_number() %>" />
                                    <input type="submit" value="更新" />
                                </form>
                                </td>
                            </c:if>
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
      <input type="button" value="戻る" onclick="location.href='input.GradesInput.action'">
     <%
        }
    %>
<script>
	const resetButton = document.getElementById("reset");
    const si = document.getElementById("student_id");
    const ssc = document.getElementById("searchschool");
    const cn = document.getElementById("class_number");
    const sj = document.getElementById("subject_name");
    const an = document.getElementById("attempt_number");
    const sn = document.getElementById("searchname");
    const grades = document.getElementsByClassName("grades");
    const gd = document.getElementById("gradesData");
		ssc.addEventListener("change", async function () {
		const params = new URLSearchParams();
		params.append("school_code", ssc.value);
		await fetch("student.StudentGetClass.action", {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		        },
		        body: params.toString()
		    })
		    .then(response => response.json())
		    .then(data => {
		        cn.innerHTML = "";
	            const opt = document.createElement("option");
	            opt.value = "";
	            opt.textContent = "選択してください";
	            cn.appendChild(opt);
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
			GradesSearch();
	})
	const search = document.getElementsByClassName("search");
	for (se of search) {
		se.addEventListener("change", () => {
			GradesSearch();
		})
	}

	const searchword = document.getElementsByClassName("searchword");
	for (sw of searchword) {
		sw.addEventListener("change", () => {
			GradesSearch();
		})
	}

	//ソートテスト
	const sorts = document.getElementsByClassName("sort")
	for (sort of sorts) {
		sort.addEventListener("click", (event) => {
			for (sortremove of sorts) {
				if(event.target.id != sortremove.id) {
					sortremove.classList.remove("asc");
					sortremove.classList.remove("desc");
				}
			}
			if (event.target.classList.contains("asc")) {
				event.target.classList.replace("asc", "desc");
			} else if(event.target.classList.contains("desc")) {
				event.target.classList.remove("desc");
			} else {
				event.target.classList.add("asc");
			}
			console.log(event.target.className.split(" ")[1]);
			const list = []
			const list2 = []
			for (grade of grades) {
				for(let i = 0; i < grade.children.length-1; i++){
					list.push(grade.children[i].textContent);
				}
			}
			const order = event.target.className.split(" ")[1];
			if (order == null){
				GradesSearch();
			} else {
				const params = new URLSearchParams();
				const cl =[];
				params.append("test", list);
				params.append("index", event.target.id);
				params.append("order", order);
				fetch("grades.GradesSort.action", {
				      method: 'POST',
				      headers: {
				          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
				      },
				      body: params.toString()
				  })
				  .then(response => response.json())
				  .then(data => {
					  grades.innerHTML = "";
				      data.forEach(item => {
			            cl.push(`<tr class="grades">
			                <td>\${item.student_id}</td>
			                <td>\${item.student_name}</td>
			                <td>\${item.school_code}</td>
			                <td>\${item.class_number}</td>
			                <td>\${item.subject_name}</td>
			                <td>\${item.attempt_number}</td>
			                <td>\${item.score}</td>
			                <c:if test="${account.access_level == 1}">
	                        <td>
	                            <form method="post" action="grades.GradesDelete.action" style="display:inline;">
	                                <input type="hidden" name="student_id" value="\${item.student_id}" />
	                                <input type="hidden" name="subject_code" value="\${item.subject_code}" />
	                                <input type="hidden" name="attempt_number" value="\${item.attempt_number}" />
	                                <input type="submit" value="削除" />
	                            </form>
	                            <form method="post" action="input.GradesUpdateInput.action" style="display:inline;">
	                                <input type="hidden" name="student_id" value="\${item.student_id}" />
	                                <input type="hidden" name="subject_code" value="\${item.subject_code}" />
	                                <input type="hidden" name="attempt_number" value="\${item.attempt_number}" />
	                                <input type="submit" value="更新" />
	                            </form>
	                            </td>
	                        </c:if>
			            </tr>`)
				      });
					  gd.innerHTML = cl.join("");
				  })
				  .catch(error => {
				      console.error("Error fetching class list:", error);
				  });

			}
		})
	}

	reset.addEventListener("click", () => {
		si.value = "";
		ssc.options[0].selected = true;
		sj.options[0].selected = true;
		an.options[0].selected = true;
		sn.value = "";
		ssc.dispatchEvent(new Event('change', { bubbles: true }));

	})

	function GradesSearch() {
		const params = new URLSearchParams();
		const cl =[];
		params.append("student_id", si.value);
		params.append("school_code", ssc.value);
		params.append("class_number", cn.value);
		params.append("subject_name", sj.value);
		params.append("attempt_number", an.value);
		params.append("student_name", sn.value);
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
			      data.forEach(item => {
		            cl.push(`<tr class="grades">
		                <td>\${item.student_id}</td>
		                <td>\${item.student_name}</td>
		                <td>\${item.school_code}</td>
		                <td>\${item.class_number}</td>
		                <td>\${item.subject_name}</td>
		                <td>\${item.attempt_number}</td>
		                <td>\${item.score}</td>
		                <c:if test="${account.access_level == 1}">
                        <td>
                            <form method="post" action="grades.GradesDelete.action" style="display:inline;">
                                <input type="hidden" name="student_id" value="\${item.student_id}" />
                                <input type="hidden" name="subject_code" value="\${item.subject_code}" />
                                <input type="hidden" name="attempt_number" value="\${item.attempt_number}" />
                                <input type="submit" value="削除" />
                            </form>
                            <form method="post" action="input.GradesUpdateInput.action" style="display:inline;">
                                <input type="hidden" name="student_id" value="\${item.student_id}" />
                                <input type="hidden" name="subject_code" value="\${item.subject_code}" />
                                <input type="hidden" name="attempt_number" value="\${item.attempt_number}" />
                                <input type="submit" value="更新" />
                            </form>
                            </td>
                        </c:if>
		            </tr>`)
			      });
				  gd.innerHTML = cl.join("");
			  })
			  .catch(error => {
			      console.error("Error fetching class list:", error);
			  });
	}
</script>
</body>
</html>