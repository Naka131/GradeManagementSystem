<%@page import="bean.Students"%>
<%@page import="bean.School"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Students> stList = (List<Students>) session.getAttribute("stList");
	List<School> scList = (List<School>)session.getAttribute("scList");

%>

<html>
<head>
    <title>学生情報</title>
    <link rel="stylesheet" href="css/list.css">
    <link rel="stylesheet" href="css/sortArrow.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
  <h2>学生一覧</h2>

  <c:if test="${not empty stList}">
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
	【氏名検索】<input type="text" id="searchname" class="searchword" placeholder="氏名検索"><button id="reset">リセット</button>
	</details>
    <table border="1">
      <thead>
        <tr>
          <th id="0" class="sort">学籍番号</th>
          <th id="1" class="sort">氏名</th>
          <th id="2" class="sort">フリガナ</th>
          <th id="3">学校コード</th>
          <th id="4">クラス番号</th>
          <th id="5" class="sort">入学年度</th>
          <th id="6">在籍状況</th>
          <c:if test="${account.access_level == 1}">
            <th>操作</th>
          </c:if>
        </tr>
      </thead>
      <tbody id="studentsData">
        <c:forEach var="st" items="${stList}">
          <tr class="students">
            <td>${st.student_id}</td>
            <td>${st.student_name}</td>
            <td>${st.student_kana}</td>
            <td>${st.school_code}</td>
            <td>${st.class_number}</td>
            <td>${st.enrollment_year}</td>
            <td>${st.is_enrolled}</td>
            <c:if test="${account.access_level == 1}">
              <td class="actions">
                <form method="post" action="input.StudentDeleteInput.action">
                  <input type="hidden" name="student_id" value="${st.student_id}" />
                  <input type="submit" value="削除" />
                </form>
                <form method="post" action="input.StudentUpdateInput.action">
                  <input type="hidden" name="student_id" value="${st.student_id}" />
                  <input type="hidden" name="student_name" value="${st.student_name}" />
                  <input type="hidden" name="is_enrolled" value="${st.is_enrolled}" />
                  <input type="submit" value="更新" />
                </form>
              </td>
            </c:if>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

  <c:if test="${empty stList}">
    <p style="text-align:center;">登録されていません</p>
  </c:if>

  <input type="button" value="戻る" onclick="location.href='input.StudentInput.action'">
</div>
<script>const access_level = <%= account.getAccess_level() %></script>
<script src="js/student_list.js"></script>
</body>
</html>
