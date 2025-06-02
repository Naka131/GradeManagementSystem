<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>科目登録</title>
</head>

<body>
	<h2>科目登録</h2>
	<form action="input.SubjectOutput.action" method="POST">
		【科目コード】<br>
		<input type="text" name="subject_code" required><br><br>
		【科目名】<br>
		<input type="text" name="subject_name" required><br><br>		

		<input type="submit" value="送信"><br><br>

		<input type="button" value="ホームに戻る" onclick="location.href='index.jsp'">
	</form>
</body>

</html>
