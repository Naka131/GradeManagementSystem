<%@page import="bean.Subjects"%>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<Subjects> sjList = (List<Subjects>) session.getAttribute("sjList");
    // JSTLで使うためにaccountをpageスコープに設定
    bean.Account account = (bean.Account) session.getAttribute("account");
    if (account != null) {
        pageContext.setAttribute("account", account);
    }
%>

<html>
<head>
    <title>科目一覧</title>
</head>
<body>
    <h1>一覧</h1>

    <c:if test="${not empty sjList}">
        <table border="1">
            <thead>
                <tr>
                    <th>科目コード</th>
                    <th>科目名</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sj" items="${sjList}">
                    <tr>
                        <td>${sj.subject_code}</td>
                        <td>${sj.subject_name}</td>
                            <c:if test="${account.access_level == 1}">
                            <td>
                                <form method="post" action="subject.SubjectDelete.action" style="display:inline;">
                                    <input type="hidden" name="subject_code" value="${sj.subject_code}" />
                                    <input type="submit" value="削除" />
                                </form>
                                <form method="post" action="input.SubjectUpdateInput.action" style="display:inline;">
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
        <p>登録されていません</p>
    </c:if>

    <input type="button" value="戻る" onclick="location.href='input.StudentsInput.action'">
</body>
</html>
