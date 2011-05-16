package sql;

/**
 * This class has a compilation of several static functions that returns SQL
 * statements to be used in the seriesbase database. All the series related SQL
 * statements are stored in this class.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version April 2011
 */
public class SQLSeriesStatements {

	/**
	 * SQL statement to select all the series in the database.
	 * 
	 * @return SQL select statement.
	 */
	public static String getAllSeries() {
		return "SELECT * FROM serie";
	}

	/**
	 * SQL statement to select a series by an id.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String getSeriesById() {
		return "SELECT * FROM serie WHERE idSerie = ?";
	}

	/**
	 * SQL statement to select all the genres of a series.
	 * 
	 * @return SQL Prepared Statement
	 */
	public static String getGenresBySeriesId() {
		return "SELECT Nome from genero, generosdaserie WHERE Serie_idSerie = ? "
				+ "AND idGenero = Genero_idGenero";
	}

	public static String getActorsBySeriesId() {
		return "SELECT idPessoa, Nome, PhotoURL FROM pessoa, actoresdaserie WHERE Serie_idSerie = ? "
				+ "AND idPessoa = Pessoa_idPessoa";
	}

	public static String getEpisodesBySeriesId() {
		return "SELECT * FROM Episodio WHERE Serie_idSerie = ?";
	}

	public static String insertSeries() {
		return "INSERT INTO serie (Nome, AnoInicial, Resumo, Network, ImageURL)"
				+ " VALUES (?, ?, ?, ?, ?)";
	}

	public static String insertEpisode() {
		return "INSERT INTO episodio (Serie_idSerie, temporada, n_episodio, titulo, "
				+ "resumo, data_exibicao) VALUES (?, ?, ?, ?, ?, ?)";
	}

	public static String insertPerson() {
		return "INSERT INTO pessoa (Nome, PhotoURL) VALUES (?, ?)";
	}

	public static String insertSeriesActor() {
		return "INSERT INTO actoresDaSerie(Serie_idSerie, Pessoa_idPessoa) VALUES (?, ?)";
	}

}
