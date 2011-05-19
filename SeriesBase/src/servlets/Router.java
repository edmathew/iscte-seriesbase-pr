package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.UsersControl;

import exceptions.NoLoginException;

/**
 * This class is the controller of the seriesbase website. It works like a
 * internet router, receiving the requests from the JSP's files, and then
 * forwarding to another page. According to the request, could be necessary,
 * some work of the business layer of the application, became the role of
 * calling to this class.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version April 2011
 */
@SuppressWarnings("serial")
@WebServlet("/router")
public class Router extends HttpServlet {

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
			String link = req.getParameter("link");
			String action = req.getParameter("action");
			if (link != null) {
				if (link.equals("userControlPanel")) {
					if (req.getSession().getAttribute("loginID") == null)
						throw new NoLoginException();

					resp.sendRedirect("userControlPanel.jsp");
				} else if (link.equals("login"))
					resp.sendRedirect("login.jsp");
			} else if (action != null) {
				if (action.equals("login")) {
					UsersControl.login(req);
					
				}

			}
		} catch (NoLoginException e) {
			resp.sendRedirect("login.jsp");
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
}
