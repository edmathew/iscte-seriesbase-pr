package databaseAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * MySQL Database manipulation Library.
 * 
 * @author Edgar Mateus
 * @version 1.0
 * 
 */
public class DatabaseManager {

	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	private static final String CONNSTRING = "jdbc:mysql://";

	private Connection conn;
	private Statement s;

	public DatabaseManager(String dbLocation, String user, String pass)
			throws SQLException {
		loadDriver();
		conn = openConnection(dbLocation, user, pass);
		conn.setAutoCommit(false);
	}

	/**
	 * Loads the Database Driver.
	 */
	public void loadDriver() {
		try {
			Class.forName(DBDRIVER).newInstance();
		} catch (Exception ex) {
			System.err.println("Cannot load DBDRIVER - " + DBDRIVER);
		}
	}

	/**
	 * Open a connection to a Database
	 * 
	 * @param dbLocation
	 *            Database Location
	 * @param user
	 *            username
	 * @param pass
	 *            password
	 * @return a connection to the Database in dbLocation.
	 */
	public Connection openConnection(String dbLocation, String user, String pass) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(CONNSTRING + dbLocation, user,
					pass);

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		return conn;
	}

	/**
	 * Executes a SQL Select operation in the current Database
	 * 
	 * @param select
	 *            Query (Select) to execute.
	 * @return ResultSet with the Results of the Query.
	 */
	public ResultSet selectStatement(String select) throws SQLException {
		ResultSet rs = null;
		s = conn.createStatement();
		rs = s.executeQuery(select);

		return rs;
	}

	/**
	 * Executes a SQL Update statement in the current Database. This method
	 * could be used to also execute delete or insert statements.
	 * 
	 * @param sqlUpdate
	 *            Query (Insert, Update or Delete) to execute.
	 * @return Retrieves the current result as an update count;
	 * @throws SQLException
	 */
	public ResultSet updateStatement(String sqlUpdate) throws SQLException {
		s = conn.createStatement();
		s.executeUpdate(sqlUpdate, Statement.RETURN_GENERATED_KEYS);
		return s.getGeneratedKeys();
	}

	public PreparedStatement preparedStatement(String sql) throws SQLException {
		return conn.prepareStatement(sql,
				PreparedStatement.RETURN_GENERATED_KEYS);
	}

	/**
	 * Releases the actual connection and the JDBC resources.
	 * 
	 * @throws SQLException
	 *             if a database acess error occurs.
	 */
	public void closeConnection() throws SQLException {
		if (conn != null && !conn.isClosed())
			conn.close();
	}

	/**
	 * Check if this connection is stil open.
	 * 
	 * @return true if the connection is closed and false otherwise.
	 * @throws SQLException
	 *             if a database access error occurs.
	 */
	public boolean isConnectionClose() throws SQLException {
		return conn.isClosed();
	}

	/**
	 * Closes the statement object.
	 * 
	 * @throws SQLException
	 */
	public void closeStatement() throws SQLException {
		if (s != null && !s.isClosed())
			s.close();
	}

	public void commit() throws SQLException {
		conn.commit();
	}

	public void rollback() throws SQLException {
		conn.rollback();
	}
}
