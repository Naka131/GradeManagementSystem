<%@page import="bean.Students"%>
<%@ page import="java.util.*, bean.Students" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>学生情報</title>
</head>
<body>
    <h1>一覧</h1>
    <%
        List<Students> stList = (List<Students>)session.getAttribute("stList");
        if (stList != null && !stList.isEmpty()) {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>学籍番号</th>
                <th>学校コード</th>
                <th>クラス番号</th>
                <th>氏名</th>
                <th>入学年度</th>
                <th>在籍状況</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Students st : stList) {
            %>
            <tr>

                <td><%= st.getStudent_id() %></td>
                <td><%= st.getSchool_code() %></td>
                <td><%= st.getClass_number() %></td>
                <td><%= st.getStudent_name() %></td>
                <td><%= st.getEnrollment_year() %></td>
                <td><%= st.getIs_enrolled() %></td>
                <td>
                <form method="post" action="student.StudentDelete.action">
             		<input type="hidden" name="student_id" value="<%= st.getStudent_id() %>" />
             		<input type="submit" value="削除" />
            	</form>
            	</td>
                <td>
                <form method="post" action="input.UpdateInput.action">
             		<input type="hidden" name="student_id" value="<%= st.getStudent_id() %>" />
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
    <a href="index.jsp">ホームへ</a>
</body>
</html>