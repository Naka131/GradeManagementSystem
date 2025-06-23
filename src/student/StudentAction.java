package student;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Students;
import dao.SchoolCodeDAO;
import dao.StudentDAO;
import tool.Action;

public class StudentAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		StudentDAO sDAO = new StudentDAO();
		List<Students> st = sDAO.search();
		SchoolCodeDAO scDAO = new SchoolCodeDAO();
		List<School> sc = scDAO.search();

		session.setAttribute("stList",st);
		session.setAttribute("scList",sc);



		return "WEB-INF/student_list.jsp";
	}
}
