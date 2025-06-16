<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String teacher_id = request.getParameter("teacher_id");
%>
<h2>本当に削除しますか？</h2>

<form action="account.AccountDelete.action" method="post">
    <input type="hidden" name="teacher_id" value="<%= teacher_id %>">
    
    <input type="submit" value="削除">
    <input type="button" value="戻る" onclick="history.back()">
</form>