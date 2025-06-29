package student;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Students;
import dao.StudentDAO;
import tool.Action;

public class StudentInsertAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
    		String student_id = request.getParameter("student_id");
            String school_code = request.getParameter("school_code");
            String class_number = request.getParameter("class_number");
            String student_name = request.getParameter("student_name");
            String student_kana = request.getParameter("student_kana");
            int enrollment_year = Integer.parseInt(request.getParameter("enrollment_year"));
            String is_enrolled = request.getParameter("is_enrolled");
            
            Students st = new Students();
            st.setStudent_id(student_id);
            st.setSchool_code(school_code);
            st.setClass_number(class_number);
            st.setStudent_name(student_name);
            st.setStudent_kana(student_kana);
            st.setEnrollment_year(enrollment_year);
            st.setIs_enrolled(is_enrolled);

            request.setAttribute("st", st);
            StudentDAO sDAO = new StudentDAO();
            sDAO.insert(st);
            
            return "WEB-INF/student_success.jsp";
            
		} catch (Exception e) {
			System.err.println(e);
			return "WEB-INF/error.jsp";
		}
	}

}
