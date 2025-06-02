package student;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Class;
import dao.ClassNumberDAO;
import tool.Action;

public class StudentGetClassAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);

		String school_code = request.getParameter("school_code");

		ClassNumberDAO cDAO = new ClassNumberDAO();


		List<Class> classList = cDAO.search(school_code);

	    response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    // JSON配列として出力
	    out.print("[");
	    for (int i = 0; i < classList.size(); i++) {
	        Class cla = classList.get(i);
	        out.print("{\"class_number\":\"" + cla.getClass_number() + "\"}");
	        if (i < classList.size() - 1) out.print(",");
	    }
	    out.print("]");
	    out.close();
	    
	    return null;

	}

}
