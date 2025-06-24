<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String student_name = request.getParameter("student_name");
    String student_kana = request.getParameter("student_kana");
    String school_code = request.getParameter("school_code");
    String class_number = request.getParameter("class_number");
    String subject_name = request.getParameter("subject_name");
    int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
    int score = Integer.parseInt(request.getParameter("score"));
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>成績登録確認</title>
  <link rel="stylesheet" href="css/output.css">
</head>
<body>
  <div class="container">
    <h2>以下の内容で登録しますか？</h2>

    <div class="confirm-item">【学籍番号】<%= student_id %></div>
    <div class="confirm-item">【氏名】<%= student_name %></div>
    <div class="confirm-item">【フリガナ】<%= student_kana %></div>
    <div class="confirm-item">【学校コード】<%= school_code %></div>
    <div class="confirm-item">【クラス番号】<%= class_number %></div>
    <div class="confirm-item">【科目名】<%= subject_name %></div>
    <div class="confirm-item">【回数】<%= attempt_number %>回目</div>
    <div class="confirm-item">【得点】<%= score %>点</div>

    <form action="grades.GradesInsert.action" method="post">
      <input type="hidden" name="student_id" value="<%= student_id %>">
      <input type="hidden" name="school_code" value="<%= school_code %>">
      <input type="hidden" name="class_number" value="<%= class_number %>">
      <input type="hidden" name="subject_name" value="<%= subject_name %>">
      <input type="hidden" name="attempt_number" value="<%= attempt_number %>">
      <input type="hidden" name="score" value="<%= score %>">

      <input type="submit" value="登録">
      <input type="button" value="戻る" onclick="history.back()">
    </form>
  </div>
</body>
</html>
