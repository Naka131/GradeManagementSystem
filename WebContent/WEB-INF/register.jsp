<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>成績管理</title>
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2>成績管理メニュー</h2>

    <div class="menu-grid">
        <a href="input.AccountRegisterInput.action" class="menu-card">アカウント登録</a>
        <a href="account.Account.action" class="menu-card">アカウント一覧</a>
    </div>
</div>

</body>
</html>
