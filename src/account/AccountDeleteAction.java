package account;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Account;
import dao.AccountDAO;
import tool.Action;

public class AccountDeleteAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    try {
		String teacher_id=request.getParameter("teacher_id");
		if (teacher_id==null) teacher_id="";

		AccountDAO aDao=new AccountDAO();
		aDao.Accountdelete(teacher_id);
		
		List<Account> acList = aDao.Accoutsearch();
        request.getSession().setAttribute("acList", acList);

		return "WEB-INF/account_delete_success.jsp";
	} catch (Exception e) {
		System.out.print(e);
		return "WEB-INF/error.jsp";
	}
    }
}
