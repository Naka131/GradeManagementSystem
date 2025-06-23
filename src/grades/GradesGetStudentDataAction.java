package grades;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Students;
import dao.StudentDAO;
import tool.Action;

public class GradesGetStudentDataAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String student_id = request.getParameter("student_id");

		StudentDAO stDAO = new StudentDAO();


		List<Students> studentList = stDAO.searchdata(student_id);


		if (studentList.isEmpty()) {
			out.print("[");
				out.println("{\"school_code\":\"\",\"class_number\":\"\",\"student_name\":\"\",\"student_kana\":\"\"}");
			out.print("]");
			out.close();
		} else {


		    out.print("[");
		    for (int i = 0; i < studentList.size(); i++) {
		        Students st = studentList.get(i);
		        out.println("{\"school_code\":\"" + st.getSchool_code() + "\",\"class_number\":\"" + st.getClass_number() + "\",\"student_name\":\"" + st.getStudent_name() + "\",\"student_kana\":\"" + st.getStudent_kana() + "\"}");
		        if (i < studentList.size() - 1) out.print(",");
		    }
		    out.print("]");
		    out.close();
		}
	    return null;

	}

}
