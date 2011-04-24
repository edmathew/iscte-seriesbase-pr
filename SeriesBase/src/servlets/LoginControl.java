package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseAccess.QueryDatabase;
import exceptions.UsernameAlreadyTaken;

/**
 * This Servlet is responsable for all of the login bussiness.
 * 
 * @author Edgar Mateus
 * @version 5/04/2011
 * 
 */
@SuppressWarnings("serial")
@WebServlet("/loginControl")
public class LoginControl extends HttpServlet {

	private QueryDatabase query = new QueryDatabase();

	/**
	 * Process get and post requests.
	 * 
	 * @param req
	 *            HttpRequest
	 * @param resp
	 *            HttpResponse
	 * @throws ServletException
	 * @throws IOException
	 */
	private void processRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			String action = req.getParameter("action");
			if (action != null) {
				if (action.equals("logout"))
					logout(req.getSession());
				else if (action.equals("login"))
					login(req);
				else if (action.equals("register")) {
					register(req);
				}
			}
			resp.sendRedirect("index.jsp");
		} catch (UsernameAlreadyTaken e) {
			req.getSession().setAttribute("duplicatedUsername", true);
			resp.sendRedirect("forms/register.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		processRequest(req, resp);
	}

	/**
	 * Ends the current session.
	 * 
	 * @param session
	 */
	private void logout(HttpSession session) {
		session.invalidate();
	}

	/**
	 * Login with the information sent in request variables.
	 * 
	 * @param session
	 *            HttpSession
	 * @param req
	 *            HttpResquest
	 */
	public void login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user = req.getParameter("log");
		String pass = req.getParameter("pwd");

		int userId = query.validLogin(user, pass);
		System.out.println(userId);
		if (userId > 0) {
			session.setAttribute("loginname", user);
			session.setAttribute("loginID", userId);
			loadUserImage(session, userId);
		} else
			session.setAttribute("bruteForceLogin", true);
	}

	public void loadUserImage(HttpSession session, int userId) {
		String URL = query.getUserImageURL(userId);
		if (URL != null && URL.length() > 0)
			session.setAttribute("loginImageURL", URL);
	}

	public void register(HttpServletRequest req) throws UsernameAlreadyTaken {
		HttpSession session = req.getSession();
		String username = req.getParameter("username");
		// String date = req.getParameter("birth");

		if (!query.checkUsernameAvaliability(username)) {
			session.setAttribute("username", req.getParameter("username"));
			session.setAttribute("email", req.getParameter("email"));
			session.setAttribute("birth", req.getParameter("birth"));
			session.setAttribute("imageURL", req.getParameter("imageURL"));
			throw new UsernameAlreadyTaken();
		}
	}
}
