<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
%>
<link rel="stylesheet" href="css/delete.css">
<div class="confirm-box">
    <h2>本当に削除しますか？</h2>

    <form action="subject.SubjectDelete.action" method="post">
        <input type="hidden" name="subject_code" value="<%=subject_code %>">

        <div class="button-group">
            <input type="submit" value="削除">
            <input type="button" value="戻る" onclick="location.href='input.StudentListInput.action'">
        </div>
    </form>
</div>
