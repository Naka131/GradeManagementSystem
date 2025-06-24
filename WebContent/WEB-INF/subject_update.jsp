<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目更新</title>
    <link rel="stylesheet" href="css/form.css">
<%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
    String subject_name = request.getParameter("subject_name");
%>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2>科目情報更新</h2>

    <form action="subject.SubjectUpdate.action" method="POST" class="form">
        <input type="hidden" name="subject_code" value="<%= subject_code %>" />

        <div class="form-group">
            <label>【科目コード】</label>
            <input type="text" name="update_subject_code" value="<%= subject_code %>" />
        </div>

        <div class="form-group">
            <label>【科目名】</label>
            <input type="text" name="subject_name" value="<%= subject_name %>" />
        </div>

        <div class="form-buttons">
            <input type="submit" value="更新">
            <input type="button" value="戻る" onclick="location.href='input.SubjectListInput.action'">
        </div>
    </form>
</div>

</body>
</html>
