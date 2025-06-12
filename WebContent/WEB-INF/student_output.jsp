<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String student_id = request.getParameter("student_id");
    String school_code = request.getParameter("school_code");
    String class_number = request.getParameter("class_number");
    String student_name = request.getParameter("student_name");
    int enrollment_year = Integer.parseInt(request.getParameter("enrollment_year"));
    String is_enrolled = request.getParameter("is_enrolled");
%>
<h2>以下の内容で登録しますか？</h2>
<p>【学籍番号】<%= student_id %></p>
<p>【学校コード】<%= school_code %></p>
<p>【クラス番号】<%= class_number %></p>
<p>【氏名】<%= student_name %></p>
<p>【入学年度】<%= enrollment_year %></p>
<p>【在籍状況】<%= is_enrolled %></p>

<form action="student.StudentInsert.action" method="post">
    <input type="hidden" name="student_id" value="<%= student_id %>">
    <input type="hidden" name="school_code" value="<%= school_code %>">
    <input type="hidden" name="class_number" value="<%= class_number %>">
    <input type="hidden" name="student_name" value="<%= student_name %>">
    <input type="hidden" name="enrollment_year" value="<%= enrollment_year %>">
    <input type="hidden" name="is_enrolled" value="<%= is_enrolled %>">
    
    <input type="submit" value="登録">
    <input type="button" value="戻る" onclick="history.back()">
</form>

