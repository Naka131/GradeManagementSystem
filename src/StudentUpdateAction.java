import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentUpdateDAO;
import tool.Action;

public class StudentUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String student_id = request.getParameter("student_id");
		String is_enrolled = request.getParameter("is_enrolled");
		if (student_id == null)
			student_id = "";

		StudentUpdateDAO uDAO = new StudentUpdateDAO();
		uDAO.update(student_id, is_enrolled);

		return "WEB-INF/update_success.jsp";
	}
}
