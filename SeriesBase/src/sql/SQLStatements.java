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
		return "SELECT idUser, password FROM user WHERE nome='" + user + "'";
	}

	public static String selectUserImageURL(int userId) {
		return "SELECT imageURL FROM user WHERE idUser=" + userId;
	}

	public static String selectUsername(String username) {
		return "SELECT COUNT(*) FROM utilizador WHERE nome='" + username + "'";
	}

	public static String selectEmail(String email) {
		return "SELECT COUNT(*) FROM utilizador WHERE email='" + email + "'";
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
