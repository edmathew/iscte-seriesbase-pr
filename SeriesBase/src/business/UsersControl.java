package business;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import utilities.HashUtilities;
import utilities.Utilities;

import databaseAccess.QueryDatabase;

/**
 * Business class to deal with the users.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version April 2011
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

		int userId = QueryDatabase.getInstance().validLogin(user,
				HashUtilities.getMD5Hash(pass));
		if (userId > 0) {
			session.setAttribute("loginname", user);
			session.setAttribute("loginID", userId);
		}
	}

	/**
	 * This method tries to update the user info, like email or password. If
	 * there isn't error the update is complete and the function returns 0,
	 * else, is returned the number of errors.
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

		if (email != null && !email.equals(query.getUserEmail(userID)))
			if (!query.checkEmailAvaliability(email)) {
				nError++;
				req.getSession().setAttribute("invalidEmail", email);
			}

		String sysPassword = query.getUserPassword(username);
		if (oldPassword != null && !sysPassword.equals(HashUtilities.getMD5Hash(oldPassword))) {
			req.getSession().setAttribute("wrongPassword", true);
			nError++;
		} else if (newPassword != null && newPassword.length() > 0
				&& !newPassword.equals(confirmPassword)) {
			req.getSession().setAttribute("wrongMatch", true);
			nError++;
		}

		if (nError == 0) {
			if (email != null && email.length() > 0)
				query.setUserEmail(userID, email);
			if (newPassword != null && newPassword.length() > 0)
				query.setUserPassword(userID, newPassword);
		}

		return nError;
	}

	/**
	 * Terminates a user session.
	 * 
	 * @param s
	 *            Session to terminate.
	 */
	public static void logout(HttpSession s) {
		s.invalidate();
	}

	public static int register(HttpServletRequest req) {
		int nErrors = 0;
		QueryDatabase query = QueryDatabase.getInstance();
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		String repeatPass = req.getParameter("repeatPassword");

		if (username != null && username.length() < 3) {
			req.getSession().setAttribute("invalidUsername", true);
			nErrors++;
		} else if (!query.checkUsernameAvaliability(username)) {
			req.getSession().setAttribute("duplicatedUsername", true);
			nErrors++;
		}

		if (!Utilities.validEmail(email)) {
			req.getSession().setAttribute("invalidEmail", true);
			nErrors++;
		} else if (!query.checkEmailAvaliability(email)) {
			req.getSession().setAttribute("duplicatedEmail", true);
			nErrors++;
		}

		if (pass == null || pass.length() < 5) {
			req.getSession().setAttribute("invalidPassword", true);
			nErrors++;
		} else if (!pass.equals(repeatPass)) {
			req.getSession().setAttribute("invalidMatch", true);
			nErrors++;
		}

		if (nErrors == 0)
			query.insertUser(username, HashUtilities.getMD5Hash(pass), email);

		return nErrors;
	}
}
