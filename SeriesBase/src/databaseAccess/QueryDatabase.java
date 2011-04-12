package databaseAccess;

import java.sql.ResultSet;
import java.sql.SQLException;

import sql.SQLStatements;

/**
 * 
 * @author Ed Mateus
 * 
 */
public class QueryDatabase {

	private static DatabaseManager db;

	public QueryDatabase() {
		if (db == null)
			try {
				db = new DatabaseManager("localhost/test", "root", "");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	/**
	 * Check if the password matches the username.<br />
	 * TODO MD5 - Password steel in Clear text.
	 * 
	 * @param username
	 *            user identifier
	 * @param password
	 *            user password
	 * @return userId or -1 if failed.
	 */
	public int validLogin(String username, String password) {
		int id = -1;
		ResultSet set;
		try {
			set = db.selectStatement(SQLStatements.selectPassword(username));
			String passInDB = null;
			if (set != null && set.next())
				passInDB = set.getString(2);

			if (password.equals(passInDB))
				id = set.getInt(1);

		} catch (SQLException e) {
		} catch (IllegalArgumentException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e) {
			}
		}
		return id;
	}

	/**
	 * Returns the userImage URL.
	 * 
	 * @param userId
	 * @return
	 */
	public String getUserImageURL(int userId) {
		String URL = null;
		ResultSet set;

		try {
			set = db.selectStatement(SQLStatements.selectUserImageURL(userId));
			if (set != null && set.next())
				URL = set.getString(1);
		} catch (SQLException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e) {
			}
		}
		return URL;
	}
}
