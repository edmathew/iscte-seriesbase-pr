package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseAccess.QueryDatabase;
import dto.Series;

@SuppressWarnings("serial")
@WebServlet("/seriesControl")
public class SeriesControl extends HttpServlet {

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
		String action = req.getParameter("action");
		if (action.equals("getAll")) {
			req.getSession().setAttribute("seriesList", query.getAllSeries().toArray());
			resp.sendRedirect("listSeries.jsp");
		}else if(action.equals("getById")){
			int id = Integer.parseInt(req.getParameter("id"));
			Series s = query.getSeriesById(id);
			req.getSession().setAttribute("series", s);
			resp.sendRedirect("showSeriesInfo.jsp");
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
