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
		int userId = 0;
		if (req.getSession().getAttribute("loginID") != null)
			userId = (Integer) req.getSession().getAttribute("loginID");

		if (action.equals("getAll")) {
			req.getSession().setAttribute("seriesList",
					query.getAllSeries().toArray());
		} else if (action.equals("getById")) {
			int id = Integer.parseInt(req.getParameter("id"));
			Series s = query.getSeriesById(id);
			if (s != null) {
				req.getSession().setAttribute("series", s);
				if (query.isFavorite(s.getId(), userId))
					req.getSession().setAttribute("isFavorite", true);
			} else
				resp.sendRedirect("error.jsp");
		} else if (action.equals("getByUserId")) {
			req.getSession().setAttribute("seriesList",
					query.getSeriesByUserId(userId).toArray());
		} else if (action.equals("addToFavorites")) {

			int seriesId = ((Series) req.getSession().getAttribute("series"))
					.getId();
			query.insertUserSeries(seriesId, userId);
			resp.sendRedirect("showSeriesInfo.jsp?id=" + seriesId);
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
