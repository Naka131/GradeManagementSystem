<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
    String subject_name = request.getParameter("subject_name");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目登録確認</title>
    <link rel="stylesheet" href="css/output.css">
</head>
<body>
  <div class="container">
    <h2>以下の内容で登録しますか？</h2>
    <div class="confirm-item">【科目コード】<%= subject_code %></div>
    <div class="confirm-item">【科目名】<%= subject_name %></div>

    <form action="subject.SubjectInsert.action" method="post">
      <input type="hidden" name="subject_code" value="<%= subject_code %>">
      <input type="hidden" name="subject_name" value="<%= subject_name %>">

      <input type="submit" value="登録">
      <input type="button" value="戻る" onclick="history.back()">
    </form>
  </div>
</body>
</html>
