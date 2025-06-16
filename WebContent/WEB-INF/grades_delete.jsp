<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String subject_code = request.getParameter("subject_code");
    int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
%>
<h2>削除しますか？</h2>

<form action="grades.GradesDelete.action" method="post">
    <input type="hidden" name="student_id" value="<%=student_id %>">
    <input type="hidden" name="subject_code" value="<%=subject_code %>">
    <input type="hidden" name="attempt_number" value="<%=attempt_number %>">
    
    <input type="submit" value="削除">
    <input type="button" value="戻る" onclick="location.href='input.GradesListInput.action'">
</form>