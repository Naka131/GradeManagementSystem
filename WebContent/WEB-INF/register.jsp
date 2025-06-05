<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
</head>
<body>
<form action="account.AccountRegister.action" method="post">
<p>すべて入力してください</p>
<p>
<label><input type="radio" name="access_level" value="1">管理者で登録する</label>
<label><input type="radio" name="access_level" value="2" checked>ユーザーで登録する</label>
</p>
　　　名前：<input type="text" name="teacher_name" required><br>
ユーザーID：<input type="text" name="teacher_id" required><br>
パスワード：<input type="password" name="password" required><br>
<input type="submit" value="登録"><br>
<input type="button" value="ホームに戻る" onclick="location.href='index.jsp'">
</form>
</body>
</html>
