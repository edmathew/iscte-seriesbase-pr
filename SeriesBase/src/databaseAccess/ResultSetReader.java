package databaseAccess;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Date;

import dto.*;

public class ResultSetReader {

	public static Genre readGenre(ResultSet set) throws SQLException {
		int id = set.getInt(1);
		String name = set.getString(2);
		return new Genre(id, name);
	}

	public static Series readSeries(ResultSet set) throws SQLException {
		int id = set.getInt(1);
		String name = set.getString(2);
		int anoInicial = set.getInt(3);
		String resumo = set.getString(4);
		String imageURL = set.getString(5);
		String network = set.getString(6);
		Series s = new Series(name, anoInicial, resumo, network, null, null);
		s.setId(id);
		s.setImageURL(imageURL);
		return s;
	}

	public static Person readPerson(ResultSet set) throws SQLException {
		int id = set.getInt(1);
		String name = set.getString(2);
		String picture = set.getString(3);
		return new Person(id, name, picture);
	}

	public static Episodio readEpisode(ResultSet set) throws SQLException {
		int id = set.getInt(1);
		int temporada = set.getInt(2);
		int n_episodio = set.getInt(3);
		String titulo = set.getString(5);
		String overview = set.getString(6);
		Date d = set.getDate(7);
		return new Episodio(id, n_episodio, temporada, titulo, d, overview);
	}
}
