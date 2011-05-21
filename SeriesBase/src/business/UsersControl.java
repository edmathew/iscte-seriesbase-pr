package business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import databaseAccess.QueryDatabase;

/**
 * Business class to deal with the users.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 * 
 */
public class UsersControl {

	/**
	 * Login with the information sent in the request variables log (login name)
	 * e pwd (password).
	 * 
	 * @param session
	 *            HttpSession
	 * @param req
	 *            HttpRequest
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

	/**
	 * Updates the user info.
	 * 
	 * @param req
	 *            HttpRequest
	 * 
	 * @return the number of errors during the update.
	 */
	public static int updateUserInfo(HttpServletRequest req) {
		int nError = 0;
		QueryDatabase query = QueryDatabase.getInstance();
		int userID = (Integer) req.getSession().getAttribute("loginID");
		String username = (String) req.getSession().getAttribute("loginname");
		String email = req.getParameter("newEmail");
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String confirmPassword = req.getParameter("confirmPassword");

		// TODO MD5 Hash
		if (email != null && !email.equals(query.getUserEmail(userID)))
			if (!query.checkEmailAvaliability(email)) {
				nError++;
				req.getSession().setAttribute("invalidEmail", email);
			}

		String sysPassword = query.getUserPassword(username);
		if (!sysPassword.equals(oldPassword)) {
			req.getSession().setAttribute("wrongPassword", true);
			nError++;
		} else if (newPassword != null && newPassword.length() > 0
				&& !newPassword.equals(confirmPassword)) {
			req.getSession().setAttribute("wrongMatch", true);
			nError++;
		}

		if (nError == 0) {
			if(email != null && email.length() > 0)
				query.setUserEmail(userID, email);
			if(newPassword != null && newPassword.length() > 0)
				query.setUserPassword(userID, newPassword);
		}

		return nError;
	}

}
