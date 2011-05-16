package sql;

/**
 * This class has a compilation of several static functions that returns SQL
 * statements to be used in the seriesbase database. This statements refer to
 * all the series genres related functions.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version May 2011
 */
public class SQLGenreStatements {

	/**
	 * SQL insert statement to add a new genre to the database.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String insertGenre() {
		return "INSERT INTO genero (Nome) VALUES (?)";
	}

	/**
	 * SQL statement to select all the series of a genre.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String getSeriesByGenre() {
		return "SELECT idSerie, Nome, AnoInicial, Resumo, ImageURL, Network FROM Serie, "
				+ "GenerosDaSerie WHERE Serie_idSerie = idSerie AND Genero_idGenero = ?";
	}

	/**
	 * SQL statement to select all the genres in the database.
	 * 
	 * @return SQL SELECT statement
	 */
	public static String getAllGenres() {
		return "SELECT * FROM Genero";
	}

	/**
	 * SQL insert statement to add a genre to a series.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String insertSeriesGenre() {
		return "INSERT INTO generosdaserie (Genero_idGenero, Serie_idSerie) VALUES (?, ?)";
	}

	/**
	 * SQL statement to select a genre info by its name.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String selectGenre() {
		return "SELECT * FROM genero WHERE nome = ?";
	}

	/**
	 * SQL select statement to check if a genre already exists in the database.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String countGenre() {
		return "SELECT COUNT(*) FROM genero WHERE nome = ?";
	}

}
