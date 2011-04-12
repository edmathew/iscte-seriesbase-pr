package sql;

/**
 * This class has a compilation of several static functions that returns SQL
 * statements to be used in the seriesbase database.
 * 
 * @author Edgar Mateus
 * @version 5/4/2011
 * 
 */
public class SQLStatements {

	public static String selectPassword(String user) {
		if (user == null || user.length() == 0)
			throw new IllegalArgumentException();

		return "SELECT idUser, password FROM user WHERE nome='" + user + "'";
	}

	public static String selectUserImageURL(int userId) {
		return "SELECT imageURL FROM user WHERE idUser=" + userId;
	}
}
