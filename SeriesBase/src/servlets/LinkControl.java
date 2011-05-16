package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/linkControl")
public class LinkControl extends HttpServlet {

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
		String link = req.getParameter("link");
		if (link != null) {
			if (link.equals("register"))
				resp.sendRedirect("register.jsp");
			else if (link.equals("home"))
				resp.sendRedirect("index.jsp");
			else if (link.equals("series"))
				resp.sendRedirect("listSeries.jsp");
			else if (link.equals("mySeries"))
				resp.sendRedirect("mySeries.jsp");
			else if (link.equals("getSeriesById"))
				resp.sendRedirect("showSeriesInfo.jsp?id="
						+ req.getParameter("id"));
			else if (link.equals("people"))
				resp.sendRedirect("people.jsp");
			else if (link.equals("about"))
				resp.sendRedirect("about.jsp");
		} else {
			resp.sendRedirect("error.jsp");
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
