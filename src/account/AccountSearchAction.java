package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.AccountDAO;
import tool.Action;

public class AccountSearchAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String teacher_id = request.getParameter("teacher_id");
        String password = request.getParameter("password");

        Account ab = new Account();
        ab.setTeacher_id(teacher_id);
        ab.setPassword(password);

        AccountDAO dao = new AccountDAO();
        Account result = dao.findAccount(ab);

        if (result != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", result);
            return "WEB-INF/loginSuccess.jsp";
        } else {
            return "WEB-INF/error.jsp";
        }
    }
}

