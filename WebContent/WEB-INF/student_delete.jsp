<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
%>
<h2>本当に削除しますか？</h2>

<form action="student.StudentDelete.action" method="post">
    <input type="hidden" name="student_id" value="<%=student_id %>">
    
    <input type="submit" value="削除">
    <input type="button" value="戻る" onclick="location.href='input.GradesListInput.action'">
</form>