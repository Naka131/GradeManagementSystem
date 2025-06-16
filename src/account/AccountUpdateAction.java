package account;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import tool.Action;

public class AccountUpdateAction extends Action {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	try {
		
		String teacher_id = request.getParameter("teacher_id");
		int access_level = Integer.parseInt(request.getParameter("access_level"));
		if (teacher_id == null)
			teacher_id = "";

		AccountDAO aDAO = new AccountDAO();
		aDAO.update(teacher_id,access_level);

		return "WEB-INF/update_success.jsp";
	} catch (Exception e) {
		System.out.print(e);
		return "WEB-INF/error.jsp";
	}
	}
}
