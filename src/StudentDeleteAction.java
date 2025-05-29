import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDeleteDAO;
import tool.Action;

public class StudentDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String student_id=request.getParameter("student_id");
		if (student_id==null) student_id="";

		StudentDeleteDAO bdao=new StudentDeleteDAO();
		bdao.delete(student_id);

		return "WEB-INF/delete_success.jsp";
    }
}
