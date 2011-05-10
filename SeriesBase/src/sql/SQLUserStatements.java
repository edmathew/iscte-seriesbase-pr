package sql;

/**
 * This class has a compilation of several static functions that returns SQL
 * statements to be used in the seriesbase database. The statements refer to all
 * the user stuff.
 * 
 * @author Edgar Mateus
 * @version 5/5/2011
 * 
 */
public class SQLUserStatements {

	/**
	 * Select statement to check if a series is in the favorites table of an
	 * user
	 * 
	 * @return SQL Prepared Statement.
	 */
	public static String selectSeries() {
		return "SELECT COUNT(*) FROM seriesdoUtilizador WHERE Serie_idSerie = ? AND Utilizador_idUtilizador = ?";
	}

}
