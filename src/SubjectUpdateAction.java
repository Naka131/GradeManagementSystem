import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectsDAO;
import tool.Action;

public class SubjectUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String update_subject_code = request.getParameter("update_subject_code");
		String subject_name = request.getParameter("subject_name");
		String subject_code = request.getParameter("subject_code");

		if (subject_code == null){
			subject_code = "";
		}
		SubjectsDAO sjDAO = new SubjectsDAO();
		sjDAO.update(update_subject_code, subject_name, subject_code);

		return "WEB-INF/update_success.jsp";
	}
}
