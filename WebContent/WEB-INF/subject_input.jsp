<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>科目登録</title>
  <link rel="stylesheet" href="css/form.css">
</head>

<body>
<%@ include file="../header.jsp" %>

<div class="container">
  <h2>科目登録</h2>

  <form action="input.SubjectOutput.action" method="POST">

    <div class="form-group">
      <label for="subject_code">科目コード</label>
      <input type="text" name="subject_code" id="subject_code" required>
    </div>

    <div class="form-group">
      <label for="subject_name">科目名</label>
      <input type="text" name="subject_name" id="subject_name" required>
    </div>

    <div class="form-buttons">
      <input type="submit" value="登録">
      <input type="button" value="戻る" onclick="location.href='input.SubjectInput.action'">
    </div>

  </form>
</div>

</body>
</html>
