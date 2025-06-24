<%@page import="bean.School"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="bean.Class"%>
<%@ page import="java.util.*, bean.Students" %>
<%@page import="bean.Subjects"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成績更新</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<%
    request.setCharacterEncoding("UTF-8");
    String subject_code = request.getParameter("subject_code");
    String student_id = request.getParameter("student_id");
    String student_name = request.getParameter("student_name");
    int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
    List<Subjects> sjList = (List<Subjects>)session.getAttribute("sjList");
%>
<body>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2>成績情報更新</h2>

    <div class="form-group">
        <label>学籍番号:</label>
        <strong><%= student_id %></strong>
    </div>

    <div class="form-group">
        <label>氏名:</label>
        <strong><%= student_name %></strong>
    </div><br>

    <form action="grades.GradesUpdate.action" method="POST" class="form">
        <input type="hidden" name="subject_code" value="<%= subject_code %>" />
        <input type="hidden" name="student_id" value="<%= student_id %>" />
        <input type="hidden" name="attempt_number" value="<%= attempt_number %>" />

        <div class="form-group">
            <label>【科目名】</label>
            <select id="subject_code" name="update_subject_code" required>
                <%
                    for (Subjects sj : sjList) {
                %>
                    <option value="<%= sj.getSubject_code() %>"><%= sj.getSubject_name() %></option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label>【回数】</label>
            <select name="update_attempt_number">
                <option value="1" selected>1</option>
                <option value="2">2</option>
            </select>
        </div>

        <div class="form-group">
            <label>【点数】</label>
            <input type="number" name="update_score" min="0" max="100" step="1" required
                   oninput="this.value =
                       this.value > 100 ? 100 :
                       this.value < 0 ? 0 : this.value">
        </div>

        <div class="form-buttons">
            <input type="submit" value="更新">
            <input type="button" value="戻る" onclick="location.href='input.GradesListInput.action'">
        </div>
    </form>
</div>

</body>
</html>
