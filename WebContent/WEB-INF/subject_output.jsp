<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
    String subject_name = request.getParameter("subject_name");
%>
<h2>以下の内容で登録しますか？</h2>
<p>【科目コード】<%= subject_code %></p>
<p>【科目名】<%= subject_name %></p>

<form action="subject.SubjectInsert.action" method="post">
    <input type="hidden" name="subject_code" value="<%= subject_code %>">
    <input type="hidden" name="subject_name" value="<%= subject_name %>">

    <input type="submit" value="登録">
    <input type="button" value="戻る" onclick="history.back()">
</form>

