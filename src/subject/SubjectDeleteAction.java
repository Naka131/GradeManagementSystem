package subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectsDAO;
import tool.Action;

public class SubjectDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	try {
		String subject_code = request.getParameter("subject_code");
		if (subject_code == null) {
			subject_code = "";
		}
		
		SubjectsDAO sjdao=new SubjectsDAO();
		sjdao.delete(subject_code);

		return "WEB-INF/delete_success.jsp";
		} catch (Exception e) {
		System.out.print(e);
		return "WEB-INF/error.jsp";
		}
    }
}
