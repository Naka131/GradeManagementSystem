package student;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import tool.Action;

public class StudentDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String student_id=request.getParameter("student_id");
		if (student_id==null) student_id="";

		StudentDAO bdao=new StudentDAO();
		bdao.delete(student_id);

		return "WEB-INF/delete_success.jsp";
    }
}
