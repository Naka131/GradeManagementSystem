import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subjects;
import dao.SubjectsDAO;
import tool.Action;

public class SubjectsListAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		SubjectsDAO sjDAO = new SubjectsDAO();
		List<Subjects> sj = sjDAO.search();

		session.setAttribute("sjList",sj);


		return "WEB-INF/subject_list.jsp";
	}

}
