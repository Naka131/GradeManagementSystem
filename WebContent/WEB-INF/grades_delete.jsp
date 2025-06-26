<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String subject_name = request.getParameter("subject_name");
    int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
%>
<link rel="stylesheet" href="css/delete.css">
<div class="confirm-box">
    <h2>本当に削除しますか？</h2>

    <form action="grades.GradesDelete.action" method="post">
        <input type="hidden" name="student_id" value="<%=student_id %>">
        <input type="hidden" name="subject_name" value="<%=subject_name %>">
        <input type="hidden" name="attempt_number" value="<%=attempt_number %>">

        <div class="button-group">
            <input type="submit" value="削除">
            <input type="button" value="戻る" onclick="location.href='input.GradesListInput.action'">
        </div>
    </form>
</div>
