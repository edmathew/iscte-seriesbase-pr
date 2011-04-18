package databaseAccess;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Episodio;
import dto.Person;
import dto.Series;

import sql.SQLStatements;

/**
 * 
 * @author Ed Mateus
 * 
 */
public class QueryDatabase {

	private DatabaseManager db;

	public QueryDatabase() {
		if (db == null)
			try {
				db = new DatabaseManager("localhost/seriesbase", "root", "");
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		} catch (IllegalArgumentException e) {
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
		} catch (SQLException e) {
		} finally {
			try {
				ps.close();
			} catch (SQLException e) {
			}
		}
	}
}
