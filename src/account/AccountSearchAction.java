package account;

import java.security.MessageDigest;

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

        String hashedPassword = hashPassword(password);

        Account ab = new Account();
        ab.setTeacher_id(teacher_id);
        ab.setPassword(hashedPassword);

        AccountDAO dao = new AccountDAO();
        Account account = dao.findAccount(ab);

        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            return "index.jsp";
        } else {
            request.setAttribute("errorMsg", "ユーザーIDまたはパスワードが正しくありません");
            return "WEB-INF/login.jsp";
        }
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



