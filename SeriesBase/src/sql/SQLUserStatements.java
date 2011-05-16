package sql;

/**
 * This class has a compilation of several static functions that returns SQL
 * statements to be used in the seriesbase database. The statements refer to all
 * the user related functions.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 */
public class SQLUserStatements {

	/**
	 * SQL select statement to check if a series is in the favorites table of an
	 * user
	 * 
	 * @return SQL Prepared Statement.
	 */
	public static String selectSeries() {
		return "SELECT COUNT(*) FROM seriesdoUtilizador WHERE Serie_idSerie = ? "
				+ "AND Utilizador_idUtilizador = ?";
	}

	/**
	 * SQL insert statement to insert a new series to the user favorite list.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String insertUserSeries() {
		return "INSERT INTO SeriesDoUtilizador (Serie_idSerie, Utilizador_idUtilizador) VALUES (?, ?)";
	}

	/**
	 * SQL statement to select statement to select all the user favorites
	 * series.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String selectSeriesByUserId() {
		return "SELECT idSerie, Nome, AnoInicial, Resumo, ImageURL, Network FROM Serie, "
				+ "SeriesDoUtilizador WHERE Serie_idSerie = idSerie AND Utilizador_idUtilizador = ?";
	}

	/**
	 * SQL statement to select the password MD5 hash for a user.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String selectPassword() {
		return "SELECT idUtilizador, password FROM utilizador WHERE nome = ?";
	}

	/**
	 * SQL select statement to select the user image URL.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String selectUserImageURL() {
		return "SELECT ImageURL FROM utilizador WHERE idUtilizador= ?";
	}

	/**
	 * SQL select statement to check if a username already exists in the
	 * database.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String selectUsername() {
		return "SELECT COUNT(*) FROM utilizador WHERE nome= ?";
	}

	/**
	 * SQL select statement to check if a email address already exists in the
	 * database.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String selectEmail() {
		return "SELECT COUNT(*) FROM utilizador WHERE email= ?";
	}

}
