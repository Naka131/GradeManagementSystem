<%@page import="bean.Students"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Students> stList = (List<Students>) session.getAttribute("stList");
%>

<html>
<head>
    <title>学生情報</title>
</head>
<body>
<%@ include file="../header.jsp" %>
    <h1>学生一覧</h1>

    <c:if test="${not empty stList}">
        <table border="1">
            <thead>
                <tr>
                    <th>学籍番号</th>
                    <th>氏名</th>
                    <th>学校コード</th>
                    <th>クラス番号</th>
                    <th>入学年度</th>
                    <th>在籍状況</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="st" items="${stList}">
                    <tr>
                        <td>${st.student_id}</td>
                        <td>${st.student_name}</td>
                        <td>${st.school_code}</td>
                        <td>${st.class_number}</td>
                        <td>${st.enrollment_year}</td>
                        <td>${st.is_enrolled}</td>
                            <c:if test="${account.access_level == 1}">
                            <td>
                                <form method="post" action="student.StudentDelete.action" style="display:inline;">
                                    <input type="hidden" name="student_id" value="${st.student_id}" />
                                    <input type="submit" value="削除" />
                                </form>
                                <form method="post" action="input.StudentUpdateInput.action" style="display:inline;">
                                    <input type="hidden" name="student_id" value="${st.student_id}" />
                                    <input type="submit" value="更新" />
                                </form>
                                </td>
                            </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty stList}">
        <p>登録されていません</p>
    </c:if>

    <input type="button" value="戻る" onclick="location.href='input.StudentInput.action'">
</body>
</html>
