<%@page import="bean.Subjects"%>
<%@page import="bean.Students"%>
<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>科目一覧</title>
</head>
<body>
    <h1>一覧</h1>
    <%
        List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
        if (sjList != null && !sjList.isEmpty()) {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>科目コード</th>
                <th>科目名</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Subjects sj : sjList) {
            %>
            <tr>

                <td><%= sj.getSubject_code() %></td>
                <td><%= sj.getSubject_name() %></td>
                <td>
                <form method="post" action="SubjectDelete.action">
             		<input type="hidden" name="subject_code" value="<%= sj.getSubject_code() %>>" />
             		<input type="submit" value="削除" />
            	</form>
            	</td>
                <td>
                <form method="post" action="input.SubjectUpdateInput.action">
             		<input type="hidden" name="subject_code" value="<%= sj.getSubject_code() %>>" />
             		<input type="submit" value="更新" />
            	</form>
            	</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        } else{
     %>
     <p>登録されていません</p>
     <%
        }
    %>
    <a href="index">ホームへ</a>
</body>
</html>