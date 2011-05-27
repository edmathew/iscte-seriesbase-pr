package business;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import databaseAccess.QueryDatabase;
import dto.Series;
import exceptions.ForbiddenException;
import exceptions.NoLoginException;

/**
 * Library to deal with the all the series objects.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version April 2011
 * 
 */
public class SeriesControl {

	/**
	 * Get all the series in the DB.
	 * 
	 * @param req
	 *            HttpServletRequest
	 */
	public static void getAllSeries(HttpServletRequest req) {
		LinkedList<Series> series = QueryDatabase.getInstance().getAllSeries();
		req.getSession().setAttribute("seriesList", series.toArray());
	}

	/**
	 * Get a single series from the Database.
	 * 
	 * @param req
	 *            HttpServletRequest
	 * @throws ForbiddenException
	 *             if the URL doesn't contains a series id.
	 */
	public static void getById(HttpServletRequest req)
			throws ForbiddenException {
		QueryDatabase query = QueryDatabase.getInstance();
		int id = Integer.parseInt(req.getParameter("id"));
		int userId = UsersControl.getUserId(req.getSession());
		Series s = query.getSeriesById(id);
		if (s != null) {
			req.getSession().setAttribute("series", s);
			if (userId != -1 && query.isFavorite(s.getId(), userId))
				req.getSession().setAttribute("isFavorite", true);
		} else
			throw new ForbiddenException();
	}

	/**
	 * Get all the favorites series of the current user.
	 * 
	 * @param req
	 *            HttpServletResponse
	 */
	public static void getByUserId(HttpServletRequest req) {
		int userId = UsersControl.getUserId(req.getSession());
		LinkedList<Series> series = QueryDatabase.getInstance()
				.getSeriesByUserId(userId);
		req.getSession().setAttribute("seriesList", series.toArray());
	}

	/**
	 * Adds a series to the user favorites list.
	 * 
	 * @param req
	 *            HttpServletRequest
	 * @throws NoLoginException
	 */
	public static void addSeriesToFavorites(HttpServletRequest req)
			throws NoLoginException {
		int userId = UsersControl.getUserId(req.getSession());
		int seriesId = ((Series) req.getSession().getAttribute("series"))
				.getId();
		if (userId < 0)
			throw new NoLoginException("router?seriesAction=addToFavorites");
		QueryDatabase.getInstance().insertUserSeries(seriesId, userId);
	}
	
	

}
