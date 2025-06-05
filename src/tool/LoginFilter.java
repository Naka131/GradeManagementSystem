package tool;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")  // すべてのリクエストに適用
public class LoginFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String url = request.getRequestURI();

        // ログイン済みかどうか
        boolean isLoggedIn = (session != null && session.getAttribute("account") != null);

        // ログイン処理や登録処理、入力画面などは許可
        boolean isLoginPage = url.endsWith("input.LoginInput.action");
        boolean isLoginAction = url.endsWith("account.AccountSearch.action");
        boolean isRegisterAction = url.endsWith("account.AccountRegister.action");
        boolean isLoginInput = url.contains("input") && url.endsWith(".action");
        boolean isStaticFile = url.matches(".*(\\.css|\\.js|\\.png|\\.jpg|\\.gif|\\.ico)$");

        if (isLoggedIn || isLoginAction || isRegisterAction || isLoginInput || isStaticFile || isLoginPage) {
            // セッションがあれば更新
            if (isLoggedIn && session != null) {
                session.setMaxInactiveInterval(30 * 60);  // セッション有効期限 30分

                Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
                sessionCookie.setMaxAge(30 * 60);
                sessionCookie.setHttpOnly(true);
                sessionCookie.setSecure(false);
                response.addCookie(sessionCookie);
            }

            chain.doFilter(req, res);  // 次に進む
        } else {
            // 未ログイン → ログイン画面へリダイレクト
            response.sendRedirect("input.LoginInput.action");
        }
    }

    public void init(FilterConfig config) throws ServletException {}
    public void destroy() {}
}
