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
		String student_id = request.getParameter("student_id");
		String school_code = request.getParameter("school_code");
		String class_number = request.getParameter("class_number");
		String subject_name = request.getParameter("subject_name");
		String attempt_number = request.getParameter("attempt_number");
		String student_name = request.getParameter("student_name");

		GradesDAO grDAO =new GradesDAO();
		List<Grades> grList = grDAO.keywordsearch(student_id,school_code,class_number,subject_name,attempt_number,student_name);
		response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    out.print("[");
	    for (int i = 0; i < grList.size(); i++) {
	        Grades gr = grList.get(i);
	        out.print("{\"student_id\":\"" + gr.getStudent_id() + "\",\"student_name\":\"" + gr.getStudent_name() + "\",\"school_code\":\"" + gr.getSchool_code() + "\",\"class_number\":\"" + gr.getClass_number() + "\",\"subject_name\":\"" + gr.getSubject_name() + "\",\"subject_code\":\"" + gr.getSubject_code() + "\",\"attempt_number\":\"" + gr.getAttempt_number() + "\",\"score\":\"" + gr.getScore() + "\"}");
	        if (i < grList.size() - 1) out.print(",");
	    }
	    out.print("]");
	    out.close();

	    return null;
	}
}
