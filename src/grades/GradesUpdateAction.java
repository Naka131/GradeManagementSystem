package grades;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Grades;
import dao.GradesDAO;
import tool.Action;

public class GradesUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {
		String update_subject_name = request.getParameter("update_subject_name");
		int update_attempt_number  = Integer.parseInt(request.getParameter("update_attempt_number"));
		int update_score  = Integer.parseInt(request.getParameter("update_score"));
		String student_id = request.getParameter("student_id");
		String subject_name = request.getParameter("subject_name");
		int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));

		if (subject_name == null){
			subject_name = "";
		}
		GradesDAO gDAO = new GradesDAO();
		gDAO.update(update_score, update_attempt_number, update_subject_name,student_id,subject_name,attempt_number);

		List<Grades> grList = gDAO.search();
        request.getSession().setAttribute("grList", grList);

		return "WEB-INF/grades_update_success.jsp";
	} catch (Exception e) {
		System.out.println(e);
		return "WEB-INF/error.jsp";
	}
	}
}
