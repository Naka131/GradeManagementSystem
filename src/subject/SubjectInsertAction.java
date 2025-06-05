package subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subjects;
import dao.SubjectsDAO;
import tool.Action;

public class SubjectInsertAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
		    String subject_code = request.getParameter("subject_code");
		    String subject_name = request.getParameter("subject_name");


            Subjects sj = new Subjects();
            sj.setSubject_code(subject_code);
            sj.setSubject_name(subject_name);

            request.setAttribute("stlist", sj);
            SubjectsDAO sjDAO = new SubjectsDAO();
            sjDAO.insert(sj);

            return "WEB-INF/subject_success.jsp";

		} catch (Exception e) {
			System.out.println(e);
			return "WEB-INF/error.jsp";
		}
	}

}
