package business;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import databaseAccess.QueryDatabase;
import dto.Person;
import exceptions.ForbiddenException;

/**
 * Library to deal with the all the people objects.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 * 
 */
public class PeopleControl {

	/**
	 * Gets all the people in the database and puts it on the session.
	 * 
	 * @param req
	 *            HttpServletRequest
	 */
	public static void getAllPeople(HttpServletRequest req) {
		LinkedList<Person> persons = QueryDatabase.getInstance()
				.getAllPersons();
		req.getSession().setAttribute("personsList", persons.toArray());
	}

	/**
	 * Gets a person in the database by ID and puts it on the session.
	 * 
	 * @param req
	 *            HttpServletRequest
	 * @throws ForbiddenException
	 *             if there isn't a valid id in the session
	 */
	public static void getById(HttpServletRequest req)
			throws ForbiddenException {
		int id = Integer.parseInt(req.getParameter("id"));
		Person p = QueryDatabase.getInstance().getPersonByID(id);
		if (p == null)
			throw new ForbiddenException();
		else
			req.getSession().setAttribute("person", p);
	}

	
}
