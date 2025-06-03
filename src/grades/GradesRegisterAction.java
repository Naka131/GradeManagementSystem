package grades;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subjects;
import dao.SchoolCodeDAO;
import dao.SubjectsDAO;
import tool.Action;

public class GradesRegisterAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();


		SchoolCodeDAO scDAO = new SchoolCodeDAO();
		List<School> sc = scDAO.search();
		SubjectsDAO sjDAO = new SubjectsDAO();
		List<Subjects> sj = sjDAO.search();
		session.setAttribute("scList",sc);
		session.setAttribute("sjList",sj);


		return "WEB-INF/gradesinput.jsp";
	}

}
