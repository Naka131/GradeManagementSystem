package student;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Students;
import dao.StudentDAO;
import tool.Action;

public class StudentSearchAction extends Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String student_id = request.getParameter("student_id");
		String school_code = request.getParameter("school_code");
		String class_number = request.getParameter("class_number");
		String student_name = request.getParameter("student_name");
		StudentDAO stDAO =new StudentDAO();
		List<Students> stList = stDAO.keywordsearch(student_id,school_code,class_number,student_name);
		response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();


	    out.print("[");
	    for (int i = 0; i < stList.size(); i++) {
	        Students st = stList.get(i);
	        out.print("{\"student_id\":\"" + st.getStudent_id() + "\",\"student_name\":\"" + st.getStudent_name() + "\",\"student_kana\":\"" + st.getStudent_kana() + "\",\"school_code\":\"" + st.getSchool_code() + "\",\"class_number\":\"" + st.getClass_number() + "\",\"enrollment_year\":\"" + st.getEnrollment_year() + "\",\"is_enrolled\":\"" + st.getIs_enrolled() + "\"}");
	        if (i < stList.size() - 1) out.print(",");
	    }
	    out.print("]");
	    out.close();

	    return null;
	}
}
