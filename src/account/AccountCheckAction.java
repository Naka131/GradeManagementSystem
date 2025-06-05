package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import tool.Action;

public class AccountCheckAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Account ab = (Account) session.getAttribute("account");

        if (ab != null) {
            if (ab.getAccess_level() == 1) {
                return "index.jsp";
            } else if (ab.getAccess_level() == 2) {
                return "index.jsp";
            }
        }

        return "WEB-INF/error.jsp";
    }
}


