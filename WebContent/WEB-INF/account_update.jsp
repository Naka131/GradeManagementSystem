<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<%
    request.setCharacterEncoding("UTF-8");
    String teacher_id = request.getParameter("teacher_id");
    String teacher_name = request.getParameter("teacher_name");
    int access_level = Integer.parseInt(request.getParameter("access_level"));
%>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2>更新</h2>

    <form action="account.AccountUpdate.action" method="POST" class="form">
        <input type="hidden" name="teacher_id" value="<%= teacher_id %>" />

        <div class="form-group">
            <label>教員ID:</label>
            <strong><%= teacher_id %></strong>
        </div>

        <div class="form-group">
            <label>教員氏名:</label>
            <strong><%= teacher_name %></strong>
        </div>

        <div class="form-group">
            <label>現在の権限:</label>
            <c:choose>
                <c:when test="<%= access_level == 1 %>">
                    <strong>管理者</strong>
                </c:when>
                <c:otherwise>
                    <strong>ユーザー</strong>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-group">
            <label>【権限】</label>
            <select name="access_level">
                <option value="1" selected>管理者</option>
                <option value="2">ユーザー</option>
            </select>
        </div>

        <div class="form-buttons">
            <input type="submit" value="送信">
            <input type="button" value="戻る" onclick="location.href='input.AccountListInput.action'">
        </div>
    </form>
</div>

</body>
</html>
