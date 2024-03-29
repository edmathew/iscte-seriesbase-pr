package databaseAccess;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import dto.*;

import sql.*;

/**
 * Queries to the seriesbase database.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version April 2011
 * 
 */
public class QueryDatabase {

	private static DatabaseManager db;
	private static QueryDatabase instance;

	/**
	 * Get's the current instance of this class.
	 * 
	 * @return a QueryDatabase instance.
	 */
	public static QueryDatabase getInstance() {
		try {
			if (instance == null || QueryDatabase.db.isConnectionClose()) {
				instance = new QueryDatabase();
			}
		} catch (SQLException e) {
		}
		return instance;
	}

	private QueryDatabase() {
		try {
			if (db == null || db.isConnectionClose())
//				db = new DatabaseManager("72.13.93.202:3307/seriesbase", "seriesbase", "atuaprima");
				db = new DatabaseManager("localhost/seriesbase", "root", "");
		} catch (SQLException e) {
		}
	}

	/************************************************************************
	 * TABLE utilizador
	 ***********************************************************************/

	/**
	 * Checks if the email already has a register in the database.
	 * 
	 * @param email
	 *            email to check.
	 * @return true if the email isn't in the database and false otherwise.
	 */
	public boolean checkEmailAvaliability(String email) {
		PreparedStatement ps = null;
		boolean avaliable = true;

		try {
			ps = db.preparedStatement(SQLUserStatements.selectEmail());
			ps.setString(1, email);
			ResultSet set = ps.executeQuery();
			if (set.next()) {
				int count = set.getInt(1);
				if (count != 0)
					avaliable = false;
			}
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return avaliable;
	}

	/**
	 * Inserts a new user in the database
	 * 
	 * @param name
	 *            Username
	 * @param passMD5
	 *            Password's MD5 hash code
	 * @param email
	 *            User email.
	 * @return true if the insert was sucefully and false otherwise.
	 */
	public boolean insertUser(String name, String passMD5, String email) {
		boolean success = false;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLUserStatements.insertUser());
			ps.setString(1, name);
			ps.setString(2, passMD5);
			ps.setString(3, email);
			ps.setDate(4, new Date(System.currentTimeMillis()));
			ps.execute();
			db.commit();
		} catch (SQLException e) {
			try {
				db.rollback();
			} catch (SQLException e1) {
			}
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return success;
	}

	/**
	 * Check if the password matches the username.
	 * 
	 * @param username
	 *            user identifier
	 * @param MD5hashPassword
	 *            the MD5 hash of the user's password
	 * @return userId or -1 if failed.
	 */
	public int validLogin(String username, String MD5hashPassword) {
		PreparedStatement ps;
		int id = -1;

		try {
			ps = db.preparedStatement(SQLUserStatements.selectPassword());
			ps.setString(1, username);
			ResultSet set = ps.executeQuery();
			String passInDB = null;
			if (set != null && set.next())
				passInDB = set.getString(2);

			if (MD5hashPassword.equals(passInDB))
				id = set.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e) {
			}
		}
		return id;
	}

	/**
	 * Checks if the username is already taken.
	 * 
	 * @param username
	 *            username to check.
	 * @return true if the username is available and false otherwise.
	 */
	public boolean checkUsernameAvaliability(String username) {
		PreparedStatement ps = null;

		boolean avaliable = true;

		try {
			ps = db.preparedStatement(SQLUserStatements.selectUsername());
			ps.setString(1, username);
			ResultSet set = ps.executeQuery();
			if (set.next()) {
				int count = set.getInt(1);
				if (count != 0)
					avaliable = false;
			}
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return avaliable;
	}

	/**
	 * Gets a email according to a userId
	 * 
	 * @param userID
	 * @return
	 */
	public String getUserEmail(int userID) {
		String email = null;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLUserStatements.selectUserEmail());
			ps.setInt(1, userID);
			ResultSet set = ps.executeQuery();
			if (set.next())
				email = set.getString(1);
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return email;
	}

	/**
	 * Sets a new email for a user.
	 * 
	 * @param userID
	 *            Database User ID
	 * @param newEmail
	 *            Email to Set
	 * @return true if success and false otherwise.
	 */
	public boolean setUserEmail(int userID, String newEmail) {
		boolean sucess = false;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLUserStatements.setUserEmail());
			ps.setString(1, newEmail);
			ps.setInt(2, userID);
			int nCols = ps.executeUpdate();
			sucess = nCols > 0;
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return sucess;
	}

	/**
	 * Gets the password MD5 hash according to a user.
	 * 
	 * @param username
	 *            the username
	 * @return the md5 hash.
	 */
	public String getUserPassword(String username) {
		String pass = null;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLUserStatements.selectPassword());
			ps.setString(1, username);
			ResultSet set = ps.executeQuery();
			if (set.next())
				pass = set.getString(2);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return pass;
	}

	/**
	 * Sets a new password for a user.
	 * 
	 * @param userID
	 *            User ID
	 * @param password
	 *            Password MD5 Hash.
	 * @return true if success and false otherwise.
	 */
	public boolean setUserPassword(int userID, String password) {
		boolean sucess = false;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLUserStatements.setUserPassword());
			ps.setString(1, password);
			ps.setInt(2, userID);
			int ncols = ps.executeUpdate();
			sucess = ncols > 0;
			db.commit();
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
		return sucess;
	}

	/************************************************************************
	 * TABLE pessoa
	 ************************************************************************/

	/**
	 * Inserts a new Person in the database.
	 * 
	 * @param p
	 *            Person to insert
	 * @return Inserted ID.
	 */
	public int insertPerson(Person p) {
		int personId = -1;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLPeopleStatements.insertPerson());
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

	/**
	 * Get all the people in the database.
	 * 
	 * @return Person LinkedList
	 */
	public LinkedList<Person> getAllPersons() {
		LinkedList<Person> all = new LinkedList<Person>();
		try {
			ResultSet set = db.selectStatement(SQLPeopleStatements
					.getAllPersons());
			while (set.next())
				all.add(ResultSetReader.readPerson(set));

		} catch (SQLException e) {
		} finally {
			try {
				db.closeStatement();
			} catch (SQLException e1) {
			}
		}
		return all;
	}

	/**
	 * Checks if a person is already in the database.
	 * 
	 * @param name
	 *            Name to Search
	 * @return Persons id or -1 if there isn't register in the database.
	 */
	public int checkIfPersonExists(String name) {
		int id = -1;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLPeopleStatements.getPersonId());
			ps.setString(1, name);
			ResultSet set = ps.executeQuery();
			if (set.next())
				id = set.getInt(1);
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e1) {
			}
		}
		return id;
	}

	/**
	 * Gets a person from the database according to a id.
	 * 
	 * @param personID
	 *            person's ID
	 * @return Person with id personID or null if the person doesn't exists.
	 */
	public Person getPersonByID(int personID) {
		Person p = null;
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLPeopleStatements.getPersonById());
			ps.setInt(1, personID);
			ResultSet set = ps.executeQuery();
			if (set.next())
				p = ResultSetReader.readPerson(set);
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e1) {
			}
		}
		return p;
	}

	/************************************************************************
	 * TABLE Series
	 ************************************************************************/

	/**
	 * Gets all the series in the database.
	 * 
	 * @return Series List
	 */
	public LinkedList<Series> getAllSeries() {
		LinkedList<Series> all = new LinkedList<Series>();
		try {
			ResultSet set = db.selectStatement(SQLSeriesStatements
					.getAllSeries());
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
	
	/**
	 * Gets all the series with a person which id is equals to personID.
	 * 
	 * @param personID
	 *            The person's ID
	 * @return Series List
	 */
	public LinkedList<Series> getSeriesByPersonId(int personID) {
		LinkedList<Series> all = new LinkedList<Series>();
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLSeriesStatements.getSeriesByPersonId());
			ps.setInt(1, personID);
			ResultSet set = ps.executeQuery();
			while (set.next())
				all.add(ResultSetReader.readSeries(set));

		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e1) {
			}
		}
		return all;
	}


	public LinkedList<Series> getSeriesByUserId(int userId) {
		PreparedStatement ps = null;
		LinkedList<Series> all = new LinkedList<Series>();
		try {
			ps = db.preparedStatement(SQLUserStatements.selectSeriesByUserId());
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
			ps = db.preparedStatement(SQLSeriesStatements.getSeriesById());
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
			ps = db.preparedStatement(SQLSeriesStatements.getGenresBySeriesId());
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
			ps = db.preparedStatement(SQLSeriesStatements.getActorsBySeriesId());
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
			ps = db.preparedStatement(SQLSeriesStatements
					.getEpisodesBySeriesId());
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
	 * 
	 * @param serie
	 */
	public void insertSeries(Series series) {
		try {
			PreparedStatement ps = db.preparedStatement(SQLSeriesStatements
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
					int personsId = checkIfPersonExists(p.getName());
					if (personsId == -1)
						personsId = insertPerson(p);

					insertSeriesActor(personsId, id);
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
		PreparedStatement ps = db.preparedStatement(SQLSeriesStatements
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

	public void insertSeriesActor(int personId, int seriesID) {
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLSeriesStatements.insertSeriesActor());
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
			ps = db.preparedStatement(SQLGenreStatements.insertGenre());
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
			ps = db.preparedStatement(SQLGenreStatements.selectGenre());
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
			ps = db.preparedStatement(SQLGenreStatements.countGenre());
			ps.setString(1, genre);
			ResultSet s = ps.executeQuery();
			if (s.next() && s.getInt(1) != 0)
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
			ps = db.preparedStatement(SQLGenreStatements.insertSeriesGenre());
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
			ps = db.preparedStatement(SQLUserStatements.insertUserSeries());
			ps.setInt(1, seriesID);
			ps.setInt(2, userID);
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
	
	public void removeUserSeries(int seriesID, int userID) {
		PreparedStatement ps = null;
		try {
			ps = db.preparedStatement(SQLUserStatements.deleteSeriesFromFavorites());
			ps.setInt(1, seriesID);
			ps.setInt(2, userID);
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

	public LinkedList<Series> getSeriesByGenre(int genreId) {
		PreparedStatement ps = null;
		LinkedList<Series> all = new LinkedList<Series>();
		try {
			ps = db.preparedStatement(SQLGenreStatements.getSeriesByGenre());
			ps.setInt(1, genreId);
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

	public LinkedList<Genre> getAllGenres() {
		PreparedStatement ps = null;
		LinkedList<Genre> all = new LinkedList<Genre>();
		try {
			ps = db.preparedStatement(SQLGenreStatements.getAllGenres());
			ResultSet set = ps.executeQuery();
			while (set.next())
				all.add(ResultSetReader.readGenre(set));

		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}

		return all;
	}

}
