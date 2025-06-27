<%@page import="bean.Account"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Account> stList = (List<Account>) session.getAttribute("acList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ユーザー一覧</title>
    <link rel="stylesheet" href="css/list.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
  <h2>ユーザー一覧</h2>

  <c:if test="${not empty acList}">
    <table>
      <thead>
        <tr>
          <th>教員ID</th>
          <th>学校コード</th>
          <th>教員名</th>
          <th>権限</th>
          <c:if test="${account.access_level == 1}">
            <th>操作</th>
          </c:if>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="ac" items="${acList}">
          <tr>
            <td>${ac.teacher_id}</td>
            <td>${ac.school_code}</td>
            <td>${ac.teacher_name}</td>
            <td>
              <c:choose>
                <c:when test="${ac.access_level == 1}">管理者</c:when>
                <c:when test="${ac.access_level == 2}">ユーザー</c:when>
              </c:choose>
            </td>
            <c:if test="${account.access_level == 1}">
              <td class="actions">
                <c:if test="${ac.access_level != 1}">
                  <form method="post" action="input.AccountDeleteInput.action">
                    <input type="hidden" name="teacher_id" value="${ac.teacher_id}" />
                    <input type="submit" value="削除" />
                  </form>
                  <form method="post" action="input.AccountUpdateInput.action">
                    <input type="hidden" name="teacher_id" value="${ac.teacher_id}" />
                    <input type="hidden" name="teacher_name" value="${ac.teacher_name}" />
                    <input type="hidden" name="access_level" value="${ac.access_level}" />
                    <input type="submit" value="更新" />
                  </form>
                </c:if>
              </td>
            </c:if>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

  <c:if test="${empty acList}">
    <p style="text-align:center;">登録されていません</p>
  </c:if>

  <input type="button" value="戻る" onclick="location.href='input.RegisterInput.action'" />
</div>
</body>
</html>
