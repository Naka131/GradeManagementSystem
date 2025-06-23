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
</head>
    <%
    request.setCharacterEncoding("UTF-8");
    String teacher_id = request.getParameter("teacher_id");
    String teacher_name = request.getParameter("teacher_name");
    int access_level = Integer.parseInt(request.getParameter("access_level"));
    %>
<body>
<%@ include file="../header.jsp" %>
	<h2>更新</h2>
	<form action="account.AccountUpdate.action" method="POST">
		<input type="hidden" name="teacher_id" value="<%= teacher_id %>" />
		<p>教員ID:<%=teacher_id %></p>
		<p>教員氏名:<%=teacher_name %></p>
		<c:choose>
		    <c:when test="<%=access_level == 1 %>">
		        <p>現在の権限:管理者</p>
		    </c:when>
		    <c:otherwise>
		        <p>現在の権限:ユーザー</p>
		    </c:otherwise>
		</c:choose>
		【権限】<br>
        <select name="access_level">
			<option value="1" selected>管理者</option>
			<option value="2">ユーザー</option>
		</select><br><br>

		<input type="submit" value="送信"><br><br>

		<input type="button" value="戻る" onclick="location.href='input.AccountListInput.action'">
	</form>
</body>
</html>
