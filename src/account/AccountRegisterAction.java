package account;

import java.security.MessageDigest;

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

        // パスワードをSHA-256でハッシュ化
        String hashedPassword = hashPassword(password);

        Account ab = new Account();
        ab.setTeacher_name(teacher_name);
        ab.setTeacher_id(teacher_id);
        ab.setPassword(hashedPassword);
        ab.setSchool_code(school_code);
        ab.setAccess_level(access_level);


        AccountRegisterDAO aDao = new AccountRegisterDAO();
        aDao.registerAccount(ab);


        return "WEB-INF/registerSuccess.jsp";
    }


    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException("パスワードのハッシュ化に失敗しました", e);
        }
    }
}

