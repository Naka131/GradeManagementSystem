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
    <link rel="stylesheet" href="css/list.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
  <h2>学生一覧</h2>

  <c:if test="${not empty stList}">
    <table>
      <thead>
        <tr>
          <th>学籍番号</th>
          <th>氏名</th>
          <th>フリガナ</th>
          <th>学校コード</th>
          <th>クラス番号</th>
          <th>入学年度</th>
          <th>在籍状況</th>
          <c:if test="${account.access_level == 1}">
            <th>操作</th>
          </c:if>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="st" items="${stList}">
          <tr>
            <td>${st.student_id}</td>
            <td>${st.student_name}</td>
            <td>${st.student_kana}</td>
            <td>${st.school_code}</td>
            <td>${st.class_number}</td>
            <td>${st.enrollment_year}</td>
            <td>
              <c:choose>
                <c:when test="${st.is_enrolled}">在籍中</c:when>
                <c:otherwise>退学</c:otherwise>
              </c:choose>
            </td>
            <c:if test="${account.access_level == 1}">
              <td>
                <form method="post" action="input.StudentDeleteInput.action">
                  <input type="hidden" name="student_id" value="${st.student_id}" />
                  <input type="submit" value="削除" />
                </form>
                <form method="post" action="input.StudentUpdateInput.action">
                  <input type="hidden" name="student_id" value="${st.student_id}" />
                  <input type="hidden" name="student_name" value="${st.student_name}" />
                  <input type="hidden" name="is_enrolled" value="${st.is_enrolled}" />
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
    <p style="text-align:center;">登録されていません</p>
  </c:if>

  <input type="button" value="戻る" onclick="location.href='input.StudentInput.action'">
</div>
</body>
</html>
