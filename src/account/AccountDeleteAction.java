package account;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import tool.Action;

public class AccountDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String teacher_id=request.getParameter("teacher_id");
		if (teacher_id==null) teacher_id="";

		AccountDAO aDao=new AccountDAO();
		aDao.Accountdelete(teacher_id);

		return "WEB-INF/delete_success.jsp";
    }
}
