import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Students;
import dao.StudentDAO;
import tool.Action;

public class StudentsAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		StudentDAO sDAO = new StudentDAO();
		List<Students> st = sDAO.search();

		session.setAttribute("stList",st);



		return "WEB-INF/student_list.jsp";
	}
}
