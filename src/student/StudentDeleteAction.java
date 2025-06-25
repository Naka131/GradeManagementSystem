package student;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Students;
import dao.StudentDAO;
import tool.Action;

public class StudentDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    try {
		String student_id=request.getParameter("student_id");
		if (student_id==null) student_id="";

		StudentDAO bdao=new StudentDAO();
		bdao.delete(student_id);
		
		List<Students> stList = bdao.search();
        request.getSession().setAttribute("stList", stList);

		return "WEB-INF/student_delete_success.jsp";
	} catch (Exception e) {
		System.out.print(e);
		return "WEB-INF/error.jsp";
	}
    }
}
