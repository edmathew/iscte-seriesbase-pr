package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseAccess.QueryDatabase;

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
		HttpSession session = req.getSession();
		String action = req.getParameter("action");
		if (action != null) {
			if (action.equals("logout"))
				logout(session);
			else if (action.equals("login"))
				login(session, req);
			else if (action.equals("register"))
				register(session, req);
		}
		resp.sendRedirect("index.jsp");
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
	public void login(HttpSession session, HttpServletRequest req) {
		String user = req.getParameter("login");
		String pass = req.getParameter("password");

		int userId = query.validLogin(user, pass);
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

	public void register(HttpSession session, HttpServletRequest req) {
		
	}

}
