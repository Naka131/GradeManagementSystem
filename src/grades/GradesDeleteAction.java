package grades;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Grades;
import dao.GradesDAO;
import tool.Action;

public class GradesDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	try {
		String student_id=request.getParameter("student_id");
		String subject_code=request.getParameter("subject_code");
		int attempt_number=Integer.parseInt(request.getParameter("attempt_number"));

		GradesDAO gdao=new GradesDAO();
		gdao.delete(student_id,subject_code,attempt_number);

		List<Grades> grList = gdao.search();
        request.getSession().setAttribute("grList", grList);

		return "WEB-INF/grades_delete_success.jsp";
    	}catch (Exception e) {
    	System.out.print(e);
		return "WEB-INF/error.jsp";
		}
    }
}
