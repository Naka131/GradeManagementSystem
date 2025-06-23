<%@page import="bean.Subjects"%>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Subjects> sjList = (List<Subjects>) session.getAttribute("sjList");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>科目一覧</title>
  <link rel="stylesheet" href="css/list.css">
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
  <h2>科目一覧</h2>

  <c:if test="${not empty sjList}">
    <table>
      <thead>
        <tr>
          <th>科目コード</th>
          <th>科目名</th>
          <c:if test="${account.access_level == 1}">
            <th>操作</th>
          </c:if>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="sj" items="${sjList}">
          <tr>
            <td>${sj.subject_code}</td>
            <td>${sj.subject_name}</td>
            <c:if test="${account.access_level == 1}">
              <td class="actions">
                <form method="post" action="input.SubjectDeleteInput.action">
                  <input type="hidden" name="subject_code" value="${sj.subject_code}" />
                  <input type="submit" value="削除" />
                </form>
                <form method="post" action="input.SubjectUpdateInput.action">
                  <input type="hidden" name="subject_code" value="${sj.subject_code}" />
                  <input type="hidden" name="subject_name" value="${sj.subject_name}" />
                  <input type="submit" value="更新" />
                </form>
              </td>
            </c:if>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

  <c:if test="${empty sjList}">
    <p style="text-align:center;">登録されていません</p>
  </c:if>

  <input type="button" value="戻る" onclick="location.href='input.SubjectInput.action'" />
</div>
</body>
</html>
