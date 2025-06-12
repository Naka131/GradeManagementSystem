package account;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import tool.Action;

public class AccountUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {
		
		String student_id = request.getParameter("student_id");
		String is_enrolled = request.getParameter("is_enrolled");
		if (student_id == null)
			student_id = "";

		StudentDAO uDAO = new StudentDAO();
		uDAO.update(student_id, is_enrolled);

		return "WEB-INF/update_success.jsp";
	} catch (Exception e) {
		return "WEB-INF/error.jsp";
	}
	}
}
