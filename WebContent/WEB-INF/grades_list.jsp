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
    <link rel="stylesheet" href="css/table.css">
    <link rel="stylesheet" href="css/sortArrow.css">
    <link rel="stylesheet" href="css/list.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
    <h1>成績一覧</h1>
    <%
        List<School> scList = (List<School>)session.getAttribute("scList");
        List<Grades> grList = (List<Grades>)session.getAttribute("grList");
        List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
        double avg = (double)session.getAttribute("avg");
        if (grList != null && !grList.isEmpty()) {
    %>
    <details>
    <summary>検索</summary>
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
    </details>
    <div id="avg">平均点:${avg}</div>
    <table border="1">
        <thead>
            <tr>
                <th id="0" class="sort">学籍番号</th>
                <th id="1" class="sort">氏名</th>
                <th id="2" class="sort">フリガナ</th>
                <th id="3">学校コード</th>
                <th id="4">クラス番号</th>
                <th id="5">科目名</th>
                <th id="6">回数</th>
                <th id="7" class="sort">点数</th>
                <c:if test="${account.access_level == 1}">
                    <th>操作</th>
                </c:if>
            </tr>
        </thead>
        <tbody id="gradesData">
            <%
                for (Grades gr : grList) {
            %>
            <tr class="grades">
                <td><%= gr.getStudent_id() %></td>
                <td><%= gr.getStudent_name() %></td>
                <td><%= gr.getStudent_kana() %></td>
                <td><%= gr.getSchool_code() %></td>
                <td><%= gr.getClass_number() %></td>
                <td><%= gr.getSubject_name() %></td>
                <td><%= gr.getAttempt_number() %></td>
                <td><%= gr.getScore() %></td>
                <c:if test="${account.access_level == 1}">
                <td class="actions">
                    <form method="post" action="input.GradesDeleteInput.action" style="display:inline;">
                        <input type="hidden" name="student_id" value="<%= gr.getStudent_id() %>" />
                        <input type="hidden" name="subject_name" value="<%= gr.getSubject_name() %>" />
                        <input type="hidden" name="attempt_number" value="<%= gr.getAttempt_number() %>" />
                        <input type="submit" value="削除" />
                    </form>
                    <form method="post" action="input.GradesUpdateInput.action" style="display:inline;">
                        <input type="hidden" name="student_id" value="<%= gr.getStudent_id() %>" />
                        <input type="hidden" name="student_name" value="<%= gr.getStudent_name() %>" />
                        <input type="hidden" name="subject_name" value="<%= gr.getSubject_name() %>" />
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
     <%
        }
    %>
    <input type="button" value="戻る" onclick="location.href='input.GradesInput.action'">
</div>
<script>const access_level = <%= account.getAccess_level() %></script>
<script src="js/grades_list.js"></script>
</body>
</html>
