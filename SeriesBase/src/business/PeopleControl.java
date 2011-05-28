package business;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import databaseAccess.QueryDatabase;
import dto.Person;

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

}
