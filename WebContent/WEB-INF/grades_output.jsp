<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String school_code = request.getParameter("school_code");
    String class_number = request.getParameter("class_number");
    String subject_name = request.getParameter("subject_name");
    int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
    int score = Integer.parseInt(request.getParameter("score"));
%>
<h2>以下の内容で登録しますか？</h2>
<p>【学籍番号】<%= student_id %></p>
<p>【学校コード】<%= school_code %></p>
<p>【クラス番号】<%= class_number %></p>
<p>【科目名】<%= subject_name %></p>
<p>【回数】<%= attempt_number %>回目</p>
<p>【得点】<%= score %>点</p>

<form action="grades.GradesInsert.action" method="post">
    <input type="hidden" name="student_id" value="<%= student_id %>">
    <input type="hidden" name="school_code" value="<%= school_code %>">
    <input type="hidden" name="class_number" value="<%= class_number %>">
    <input type="hidden" name="subject_name" value="<%= subject_name %>">
    <input type="hidden" name="attempt_number" value="<%= attempt_number %>">
    <input type="hidden" name="score" value="<%= score %>">
    
    <input type="submit" value="登録">
    <input type="button" value="戻る" onclick="history.back()">
</form>

