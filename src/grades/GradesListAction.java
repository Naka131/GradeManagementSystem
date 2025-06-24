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
		double avg = 0;
		for (Grades g : gr) {
			avg += g.getScore();
		}
		int tmp = (int)((avg / gr.size()) * 100);
		avg = (double)tmp / 100;

		session.setAttribute("sjList",sj);
		session.setAttribute("scList",sc);
		session.setAttribute("grList",gr);
		session.setAttribute("avg",avg);


		return "WEB-INF/grades_list.jsp";
	}

}
