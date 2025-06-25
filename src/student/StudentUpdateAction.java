package student;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Students;
import dao.StudentDAO;
import tool.Action;

public class StudentUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {

		String student_id = request.getParameter("student_id");
		String is_enrolled = request.getParameter("is_enrolled");
		if (student_id == null)
			student_id = "";

		StudentDAO uDAO = new StudentDAO();
		uDAO.update(student_id, is_enrolled);
		
		List<Students> stList = uDAO.search();
        request.getSession().setAttribute("stList", stList);

		return "WEB-INF/student_update_success.jsp";
	} catch (Exception e) {
		return "WEB-INF/error.jsp";
	}
	}
}
