package account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Account;
import dao.AccountRegisterDAO;
import tool.Action;

public class AccountRegisterAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String teacher_name = request.getParameter("teacher_name");
        String teacher_id = request.getParameter("teacher_id");
        String password = request.getParameter("password");
        String school_code = request.getParameter("school_code");
        int access_level = Integer.parseInt(request.getParameter("access_level"));

        Account ab = new Account();
        ab.setTeacher_name(teacher_name);
        ab.setTeacher_id(teacher_id);
        ab.setPassword(password);
        ab.setSchool_code(school_code);
        ab.setAccess_level(access_level);

        AccountRegisterDAO aDao = new AccountRegisterDAO();
        aDao.registerAccount(ab);
        

        return "WEB-INF/registerSuccess.jsp";
    }
}
