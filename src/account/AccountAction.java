package account;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.AccountDAO;
import tool.Action;

public class AccountAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		AccountDAO aDAO = new AccountDAO();
		List<Account> ac = aDAO.Accoutsearch();

		session.setAttribute("acList",ac);



		return "WEB-INF/account_list.jsp";
	}
}
