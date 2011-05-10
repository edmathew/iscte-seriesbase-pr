package databaseAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import dto.Episodio;
import dto.Genre;
import dto.Person;
import dto.Series;

import sql.SQLStatements;
import sql.SQLUserStatements;

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
				db = new DatabaseManager("localhost/seriesbase", "root", "");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public LinkedList<Series> getAllSeries() {
		LinkedList<Series> all = new LinkedList<Series>();
		try {
			ResultSet set = db.selectStatement(SQLStatements.getAllSeries());
			while (set.next())
				all.add(ResultSetReader.readSeries(set));

		} catch (SQLException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e1) {
			}
		}
		return all;
	}

	public LinkedList<Series> getSeriesByUserId(int userId) {
		PreparedStatement ps = null;
		LinkedList<Series> all = new LinkedList<Series>();
		try {
			ps = db.preparedStatement(SQLStatements.selectSeriesByUserId());
			ps.setInt(1, userId);
			ResultSet set = ps.executeQuery();
			while (set.next())
				all.add(ResultSetReader.readSeries(set));

		} catch (SQLException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e1) {
			}
		}
		return all;
	}

	public Series getSeriesById(int id) {
		PreparedStatement ps = null;
		Series s = null;
		try {
			ps = db.preparedStatement(SQLStatements.getSeriesById());
			ps.setInt(1, id);
			ResultSet set = ps.executeQuery();
			if (set != null && set.next())
				s = ResultSetReader.readSeries(set);

			s.setGenres(getGenresBySeriesID(id));
			s.setActors(getActorsBySeriesID(id));
			s.setEpisodes(getEpisodesBySeriesID(id));
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return s;
	}

	public LinkedList<String> getGenresBySeriesID(int id) {
		LinkedList<String> result = new LinkedList<String>();
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.getGenresBySeriesId());
			ps.setInt(1, id);
			ResultSet set = ps.executeQuery();
			if (set != null)
				while (set.next())
					result.add(set.getString(1));

		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return result;
	}

	public LinkedList<Person> getActorsBySeriesID(int id) {
		LinkedList<Person> result = new LinkedList<Person>();
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.getActorsBySeriesId());
			ps.setInt(1, id);
			ResultSet set = ps.executeQuery();
			if (set != null)
				while (set.next())
					result.add(ResultSetReader.readPerson(set));

		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return result;
	}

	public LinkedList<Episodio> getEpisodesBySeriesID(int id) {
		LinkedList<Episodio> result = new LinkedList<Episodio>();
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.getEpisodesBySeriesId());
			ps.setInt(1, id);
			ResultSet set = ps.executeQuery();
			if (set != null)
				while (set.next())
					result.add(ResultSetReader.readEpisode(set));

		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return result;
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

	/**
	 * Checks if the username is already taken.
	 * 
	 * @param username
	 *            username to check.
	 * @return true if the username is already taken and false otherwise.
	 */
	public boolean checkUsernameAvaliability(String username) {
		ResultSet set;
		boolean avaliable = true;

		try {
			set = db.selectStatement(SQLStatements.selectUsername(username));
			set.next();
			int count = set.getInt(1);
			if (count != 0)
				avaliable = false;
		} catch (SQLException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e) {
			}
		}

		return avaliable;
	}

	/**
	 * Checks if the email already has a register in the database.
	 * 
	 * @param email
	 *            email to check.
	 * @return true if the email isn't in the database and false otherwise.
	 */
	public boolean checkEmailAvaliability(String email) {
		ResultSet set;
		boolean avaliable = true;

		try {
			set = db.selectStatement(SQLStatements.selectEmail(email));
			set.next();
			int count = set.getInt(1);
			if (count != 0)
				avaliable = false;
		} catch (SQLException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e) {
			}
		}

		return avaliable;
	}

	/**
	 * 
	 * @param serie
	 */
	public void insertSeries(Series series) {
		try {
			PreparedStatement ps = db.preparedStatement(SQLStatements
					.insertSeries());
			ps.setString(1, series.getName());
			if (series.getAnoInicial() != -1)
				ps.setInt(2, series.getAnoInicial());
			else
				ps.setNull(2, java.sql.Types.INTEGER);

			ps.setString(3, series.getResumo());
			ps.setString(4, series.getNetwork());
			ps.setString(5, series.getImageURL());

			ps.executeUpdate();
			db.commit();
			ResultSet s = ps.getGeneratedKeys();
			if (s.next()) {
				int id = s.getInt(1);
				for (Episodio e : series.getEpisodes())
					insertEpisode(id, e);

				for (Person p : series.getActors()) {
					int pId = insertPerson(p);
					if (pId != -1)
						insertSeriesActor(pId, id);
				}
				for (String g : series.getGenres()) {
					int genreId = getGenreId(g);
					insertSeriesGenre(id, genreId);
				}
			}
			db.commit();

		} catch (SQLException e1) {
			try {
				db.rollback();
			} catch (SQLException e2) {
			}
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e1) {
			}
		}
	}

	public void insertEpisode(int seriesID, Episodio e) throws SQLException {
		PreparedStatement ps = db.preparedStatement(SQLStatements
				.insertEpisode());
		ps.setInt(1, seriesID);
		ps.setInt(2, e.getTemporada());
		ps.setInt(3, e.getNumero());
		ps.setString(4, e.getTitulo());
		ps.setString(5, e.getOverview());
		if (e.getDateExibicao() != null)
			ps.setDate(6, new java.sql.Date(e.getDateExibicao().getTime()));
		else
			ps.setNull(6, java.sql.Types.DATE);

		ps.executeUpdate();
		db.commit();
	}

	public int insertPerson(Person p) {
		int personId = -1;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.insertPerson());
			ps.setString(1, p.getName());
			if (p.getImageURL() != null)
				ps.setString(2, p.getImageURL());
			else
				ps.setNull(2, java.sql.Types.VARCHAR);

			ps.executeUpdate();
			ResultSet s = ps.getGeneratedKeys();
			if (s != null && s.next())
				personId = s.getInt(1);
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return personId;
	}

	public void insertSeriesActor(int personId, int seriesID) {
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.insertSeriesActor());
			ps.setInt(1, seriesID);
			ps.setInt(2, personId);
			ps.executeUpdate();
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
	}

	public int getGenreId(String genre) {
		if (exists(genre))
			return selectGenre(genre).getId();
		else
			return insertGenre(genre);
	}

	private int insertGenre(String genre) {
		int id = -1;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.insertGenre());
			ps.setString(1, genre);
			ps.executeUpdate();
			ResultSet s = ps.getGeneratedKeys();
			if (s != null && s.next())
				id = s.getInt(1);
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return id;
	}

	private Genre selectGenre(String genre) {
		PreparedStatement ps = null;
		Genre g = null;
		try {
			ps = db.preparedStatement(SQLStatements.selectGenre());
			ps.setString(1, genre);
			ResultSet s = ps.executeQuery();
			if (s != null && s.next()) {
				int id = s.getInt(1);
				String name = s.getString(2);
				g = new Genre(id, name);
			}
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return g;
	}

	private boolean exists(String genre) {
		PreparedStatement ps = null;
		boolean exists = false;
		try {
			ps = db.preparedStatement(SQLStatements.countGenre());
			ps.setString(1, genre);
			ResultSet s = ps.executeQuery();
			if (s != null && s.next() && s.getInt(0) != 0)
				exists = true;
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return exists;
	}

	public void insertSeriesGenre(int seriesID, int genreID) {
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.insertSeriesGenre());
			ps.setInt(2, seriesID);
			ps.setInt(1, genreID);
			ps.executeUpdate();
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
	}

	public void insertUserSeries(int seriesID, int userID) {
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLStatements.insertUserSeries());
			ps.setInt(2, seriesID);
			ps.setInt(1, userID);
			ps.executeUpdate();
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
	}

	public boolean isFavorite(int seriesId, int userId) {
		PreparedStatement ps = null;
		boolean isFavorite = false;
		try {
			ps = db.preparedStatement(SQLUserStatements.selectSeries());
			ps.setInt(1, seriesId);
			ps.setInt(2, userId);
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getInt(1) > 0)
				isFavorite = true;
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return isFavorite;
	}

}
