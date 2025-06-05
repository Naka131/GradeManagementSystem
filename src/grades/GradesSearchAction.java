package grades;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Grades;
import dao.GradesDAO;
import tool.Action;

public class GradesSearchAction extends Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String keyword = request.getParameter("keyword");

		GradesDAO grDAO =new GradesDAO();
		List<Grades> grList = grDAO.keywordsearch(keyword);
		response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    out.print("[");
	    for (int i = 0; i < grList.size(); i++) {
	        Grades gr = grList.get(i);
	        out.print("{\"student_id\":\"" + gr.getStudent_id() + "\",\"school_code\":\"" + gr.getSchool_code() + "\",\"class_number\":\"" + gr.getClass_number() + "\",\"subject_code\":\"" + gr.getSubject_code() + "\",\"attempt_number\":\"" + gr.getAttempt_number() + "\",\"score\":\"" + gr.getScore() + "\"}");
	        if (i < grList.size() - 1) out.print(",");
	    }
	    out.print("]");
	    out.close();

	    return null;
	}
}
