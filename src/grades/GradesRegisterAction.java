package grades;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Students;
import bean.Subjects;
import dao.SchoolCodeDAO;
import dao.StudentDAO;
import dao.SubjectsDAO;
import tool.Action;

public class GradesRegisterAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		try {
		SchoolCodeDAO scDAO = new SchoolCodeDAO();
		List<School> sc = scDAO.search();
		SubjectsDAO sjDAO = new SubjectsDAO();
		List<Subjects> sj = sjDAO.search();
		StudentDAO stDAO = new StudentDAO();
		List<Students> st = stDAO.search();
		session.setAttribute("scList",sc);
		session.setAttribute("stList",st);
		session.setAttribute("sjList",sj);


		return "WEB-INF/grades_input.jsp";
		} catch (Exception e) {
			System.out.print(e);
			return "WEB-INF/error.jsp";
		}
	}

}
