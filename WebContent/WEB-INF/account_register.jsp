<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<%
        List<School> scList = (List<School>)session.getAttribute("scList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<form action="account.AccountRegister.action" method="post">
<h2>新規登録</h2>
<p>
<label><input type="radio" name="access_level" value="1">管理者で登録する</label>
<label><input type="radio" name="access_level" value="2" checked>ユーザーで登録する</label>
</p>
<label>&emsp;&emsp;&emsp;【名前】: <input type="text" name="teacher_name" required></label><br>
<label>【ユーザーID】: <input type="text" name="teacher_id" required></label><br>
<label>【パスワード】: <input type="password" name="password" required></label><br>
<label>【学校コード】:
    <select id="school_code" name="school_code" required>
        <%
            for (School sc : scList) {
        %>
            <option value="<%= sc.getSchool_code() %>"><%= sc.getSchool_code() %></option>
        <%
            }
        %>
    </select>
</label><br>
<input type="submit" value="登録"><br>
<c:choose>
<c:when test="${account.access_level == 1 }">
<input type="button" value="戻る" onclick="location.href='input.RegisterInput.action'">
</c:when>
<c:otherwise>
<input type="button" value="戻る" onclick="location.href='input.LoginInput.action'">
</c:otherwise>
</c:choose>
</form>
</body>
</html>