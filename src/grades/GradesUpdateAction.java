package grades;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GradesDAO;
import tool.Action;

public class GradesUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {
		String update_subject_code = request.getParameter("update_subject_code");
		int update_attempt_number  = Integer.parseInt(request.getParameter("update_attempt_number"));
		int update_score  = Integer.parseInt(request.getParameter("update_score"));
		String student_id = request.getParameter("student_id");
		String subject_code = request.getParameter("subject_code");
		int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));

		if (subject_code == null){
			subject_code = "";
		}
		GradesDAO gDAO = new GradesDAO();
		gDAO.update(update_score, update_attempt_number, update_subject_code,student_id,subject_code,attempt_number);

		return "WEB-INF/update_success.jsp";
	} catch (Exception e) {
		return "WEB-INF/error.jsp";
	}
	}
}
