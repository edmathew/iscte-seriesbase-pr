package business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import databaseAccess.QueryDatabase;

public class UsersControl {

	/**
	 * Login with the information sent in the request variables log (login name)
	 * e pwd (password).
	 * 
	 * @param session
	 *            HttpSession
	 * @param req
	 *            HttpResquest
	 */
	public static void login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = req.getParameter("log");
		String pass = req.getParameter("pwd");

		int userId = QueryDatabase.getInstance().validLogin(user, pass);
		if (userId > 0) {
			session.setAttribute("loginname", user);
			session.setAttribute("loginID", userId);
		}
	}
}
