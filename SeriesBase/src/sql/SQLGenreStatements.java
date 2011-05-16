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
	
	
}
