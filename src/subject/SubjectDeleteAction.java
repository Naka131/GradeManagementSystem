package subject;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subjects;
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
		
		List<Subjects> sjList = sjdao.search();
        request.getSession().setAttribute("sjList", sjList);

		return "WEB-INF/subject_delete_success.jsp";
		} catch (Exception e) {
		System.out.print(e);
		return "WEB-INF/error.jsp";
		}
    }
}
