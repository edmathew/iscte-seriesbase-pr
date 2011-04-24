package databaseAccess;

import java.sql.ResultSet;
import java.sql.SQLException;

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
}
