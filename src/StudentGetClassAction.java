import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Class;
import dao.ClassNumberDAO;
import tool.Action;

public class StudentGetClassAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String school_code = request.getParameter("school_code");

		ClassNumberDAO cDAO = new ClassNumberDAO();

		List<Class> c = cDAO.search(school_code);

		for (Class cla : c) {
			System.out.println(cla.getClass_number());
		}
		
		session.setAttribute("cList2",c);

		return null;

	}

}
