package grades;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Grades;
import dao.GradesDAO;
import tool.Action;

public class GradesInsertAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
    		String student_id = request.getParameter("student_id");
            String school_code = request.getParameter("school_code");
            String class_number = request.getParameter("class_number");
            String subject_name = request.getParameter("subject_name");
            int attempt_number = Integer.parseInt(request.getParameter("attempt_number"));
            int score = Integer.parseInt(request.getParameter("score"));
            
            
            Grades gd = new Grades();
            gd.setStudent_id(student_id);
            gd.setSchool_code(school_code);
            gd.setClass_number(class_number);
            gd.setSubject_name(subject_name);
            gd.setAttempt_number(attempt_number);
            gd.setScore(score);

            request.setAttribute("gd", gd);
            GradesDAO gDAO = new GradesDAO();
            gDAO.insert(gd);
            
            return "WEB-INF/success.jsp";
            
		} catch (Exception e) {
			System.err.println(e);
			return "WEB-INF/error.jsp";
		}
	}

}
