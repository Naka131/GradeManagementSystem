<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
%>
<h2>本当に削除しますか？</h2>

<form action="subject.SubjectDelete.action" method="post">
    <input type="hidden" name="subject_code" value="<%=subject_code %>">
    
    <input type="submit" value="削除">
    <input type="button" value="戻る" onclick="location.href='input.GradesListInput.action'">
</form>