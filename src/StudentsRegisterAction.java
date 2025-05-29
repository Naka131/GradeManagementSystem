import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Class;
import bean.School;
import dao.ClassNumberDAO;
import dao.SchoolCodeDAO;
import tool.Action;

public class StudentsRegisterAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		
		SchoolCodeDAO scDAO = new SchoolCodeDAO();
		List<School> sc = scDAO.search();
		
		ClassNumberDAO cDAO = new ClassNumberDAO();
		List<Class> c = cDAO.search();
		session.setAttribute("scList",sc);
		session.setAttribute("cList",c);


		return "WEB-INF/input.jsp";
	}

}
