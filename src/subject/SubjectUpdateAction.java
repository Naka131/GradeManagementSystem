package subject;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subjects;
import dao.SubjectsDAO;
import tool.Action;

public class SubjectUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {
		String update_subject_code = request.getParameter("update_subject_code");
		String subject_name = request.getParameter("subject_name");
		String subject_code = request.getParameter("subject_code");

		if (subject_code == null){
			subject_code = "";
		}
		SubjectsDAO sjDAO = new SubjectsDAO();
		sjDAO.update(update_subject_code, subject_name, subject_code);

		List<Subjects> sjList = sjDAO.search();
        request.getSession().setAttribute("sjList", sjList);

		return "WEB-INF/subject_update_success.jsp";
	} catch (Exception e) {
		return "WEB-INF/error.jsp";
	}
	}
}
