<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
<form action="account.AccountSearch.action" method="post">
ユーザーID：<input type="text" name="teacher_id" required><br>
パスワード：<input type="password" name="password" required><br>
<input type="submit" value="ログイン"><br>
<a href="input.AccountRegisterInput.action">新規登録</a>
</form>
</body>
</html>