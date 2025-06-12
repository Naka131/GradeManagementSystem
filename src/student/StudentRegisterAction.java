package student;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import dao.SchoolCodeDAO;
import tool.Action;

public class StudentRegisterAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();


		SchoolCodeDAO scDAO = new SchoolCodeDAO();
		List<School> sc = scDAO.search();
		session.setAttribute("scList",sc);


		return "WEB-INF/student_input.jsp";
	}

}
