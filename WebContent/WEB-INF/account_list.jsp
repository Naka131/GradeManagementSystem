<%@page import="bean.Account"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Account> stList = (List<Account>) session.getAttribute("acList");
%>

<html>
<head>
    <title>学生情報</title>
</head>
<body>
<%@ include file="../header.jsp" %>
    <h1>ユーザー覧</h1>

    <c:if test="${not empty acList}">
        <table border="1">
            <thead>
                <tr>
                    <th>教員ID</th>
                    <th>学校コード</th>
                    <th>教員名</th>
                    <th>権限</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ac" items="${acList}">
                    <tr>
                        <td>${ac.teacher_id}</td>
                        <td>${ac.school_code}</td>
                        <td>${ac.teacher_name}</td>
                        <c:if test="${ac.access_level == 1}">
                        <td>管理者</td>
                        </c:if>
                        <c:if test="${ac.access_level == 2}">
                        <td>ユーザー</td>
                        </c:if>
                            <c:if test="${account.access_level == 1 && ac.teacher_id != account.teacher_id}">
							    <td>
							        <form method="post" action="account.AccountDelete.action" style="display:inline;">
							            <input type="hidden" name="teacher_id" value="${ac.teacher_id}" />
							            <input type="submit" value="削除" />
							        </form>
							        <form method="post" action="input.StudentUpdateInput.action" style="display:inline;">
							            <input type="hidden" name="teacher_id" value="${ac.teacher_id}" />
							            <input type="submit" value="更新" />
							        </form>
							    </td>
							</c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty acList}">
        <p>登録されていません</p>
    </c:if>

    <input type="button" value="戻る" onclick="location.href='input.RegisterInput.action'">
</body>
</html>	