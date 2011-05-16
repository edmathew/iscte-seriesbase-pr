package test;

import java.util.LinkedList;

import databaseAccess.QueryDatabase;
import dto.Genre;

public class TestGenre {

	public static void main(String[] args) {
		QueryDatabase db = new QueryDatabase();
		LinkedList<Genre> genres = db.getAllGenres();
		System.out.println(genres);
		
	}

}
