package grades;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Grades;
import bean.School;
import bean.Subjects;
import dao.GradesDAO;
import dao.SchoolCodeDAO;
import dao.SubjectsDAO;
import tool.Action;

public class GradesListAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		SchoolCodeDAO scDAO = new SchoolCodeDAO();
		List<School> sc = scDAO.search();
		
		GradesDAO grDAO = new GradesDAO();
		List<Grades> gr = grDAO.search();
		
		SubjectsDAO sjDAO = new SubjectsDAO();
		List<Subjects> sj = sjDAO.search();

		session.setAttribute("sjList",sj);
		session.setAttribute("scList",sc);
		session.setAttribute("grList",gr);


		return "WEB-INF/grades_list.jsp";
	}

}
