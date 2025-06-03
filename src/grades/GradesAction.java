package grades;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Grades;
import dao.GradesDAO;
import tool.Action;

public class GradesAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		GradesDAO gDAO = new GradesDAO();
		List<Grades> gd = gDAO.search();

		session.setAttribute("gdList",gd);



		return "WEB-INF/grades_list.jsp";
	}
}
