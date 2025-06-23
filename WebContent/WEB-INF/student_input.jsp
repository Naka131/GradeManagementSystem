<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>学生登録</title>
<link rel="stylesheet" href="css/form.css">
</head>

<body>
<%@ include file="../header.jsp" %>

<div class="container">
  <h2>学生登録</h2>
  <form action="input.StudentOutput.action" method="POST">

    <div class="form-group">
      <label for="student_id">学籍番号</label>
      <input type="number" name="student_id" id="student_id" required oninput="limitLength(this, 7)">
    </div>

    <div class="form-group">
      <label for="school_code">学校コード</label>
      <select id="school_code" name="school_code" required>
        <%
          List<School> scList = (List<School>)session.getAttribute("scList");
          for (School sc : scList) {
        %>
          <option value="<%= sc.getSchool_code() %>"><%= sc.getSchool_code() %></option>
        <%
          }
        %>
      </select>
    </div>

    <div class="form-group">
      <label for="class_number">クラス番号</label>
      <select id="class_number"  name="class_number" required>
      </select>
    </div>

    <div class="form-group">
      <label for="student_name">氏名</label>
      <input type="text" id="student_name" name="student_name" required>
    </div>
    
    <div class="form-group">
      <label for="student_kana">フリガナ</label>
      <input type="text" id="student_kana" name="student_kana" required>
    </div>

    <div class="form-group">
      <label for="enrollment_year">入学年度</label>
      <input type="number" id="enrollment_year" name="enrollment_year" required oninput="limitLength(this, 4)">
    </div>

    <div class="form-group">
      <label for="is_enrolled">在籍状況</label>
      <select name="is_enrolled" id="is_enrolled">
        <option value="在籍" selected>在籍</option>
        <option value="退学">退学</option>
        <option value="休学">休学</option>
        <option value="卒業">卒業</option>
      </select>
    </div>
    <div class="form-buttons">
		<input type="submit" value="登録">
		<input type="button" value="戻る" onclick="location.href='input.StudentInput.action'">
	</div>

  </form>
</div>

<script src="js/student_input.js"></script>
</body>
</html>
