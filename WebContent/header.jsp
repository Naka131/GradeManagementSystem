<%@ page import="bean.Account" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    bean.Account account = (bean.Account) session.getAttribute("account");
    if (account != null) {
        pageContext.setAttribute("account", account);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<div class="header-left">
  <div class="header-inner">
    <nav class="nav-left">
      <a href="index.jsp">成績管理システム</a>
    </nav>
    <nav class="nav-right">
      <span class="teacher_name">${account.teacher_name}</span>
      <a href="input.LogoutInput.action">ログアウト</a>
    </nav>
  </div>
</div>

