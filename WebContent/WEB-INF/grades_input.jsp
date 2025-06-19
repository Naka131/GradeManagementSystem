<%@page import="bean.Subjects"%>
<%@page import="bean.School"%>
<%@page import="bean.Class"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>成績登録</title>
  <link rel="stylesheet" href="css/table.css">
  <link rel="stylesheet" href="css/form.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<%
    List<Students> stList = (List<Students>)session.getAttribute("stList");
    List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
%>

<div class="container">
  <h2>成績登録</h2>

  <form action="input.GradesOutput.action" method="POST">
    <div class="form-group">
	  <label>【学籍番号】</label>
	  <input type="text" list="stlist" id="student_id" name="student_id" class="searchword" required maxlength="10" autocomplete="off">
	  <datalist id="stlist">
	    <% for (Students st : stList) { %>
	      <option value="<%= st.getStudent_id() %>"><%= st.getStudent_id() %></option>
	    <% } %>
	  </datalist>
	</div>


    <div class="form-group">
      <label>【氏名】</label>
      <input type="text" id="student_name" name="student_name" readonly>
    </div>

    <div class="form-group">
      <label>【学校コード】</label>
      <input type="text" id="school_code" name="school_code" readonly>
    </div>

    <div class="form-group">
      <label>【クラス番号】</label>
      <input type="text" id="class_number" name="class_number" readonly>
    </div>

    <div class="form-group">
      <label>【科目名】</label>
      <select id="subject_name" name="subject_name" required>
        <% for (Subjects sj : sjList) { %>
          <option value="<%= sj.getSubject_name()%>"><%= sj.getSubject_name() %></option>
        <% } %>
      </select>
    </div>

    <div class="form-group">
      <label>【回数】</label>
      <select name="attempt_number">
        <option value="1" selected>1</option>
        <option value="2">2</option>
      </select>
    </div>

    <div class="form-group">
      <label>【点数】</label>
      <input type="number" name="score" min="0" max="100" step="1" required
        oninput="this.value = 
          this.value > 100 ? 100 : 
          this.value < 0 ? 0 : this.value">
    </div>

    <div class="form-buttons">
      <input type="submit" value="登録">
      <input type="button" value="戻る" onclick="location.href='input.GradesInput.action'">
    </div>
  </form>
</div>
<script src="js/grades_input.js"></script>
</body>
</html>
