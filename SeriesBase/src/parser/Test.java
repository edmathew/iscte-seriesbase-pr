package parser;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import dto.*;

import databaseAccess.QueryDatabase;

public class Test {

	public static void main(String[] args) {
		System.out.println("Database information.......");
		QueryDatabase q = new QueryDatabase();
		try {
			Scanner file = new Scanner(new File("SeriesIDs.txt"));
			while (file.hasNextInt()) {
				int id = file.nextInt();
				System.out.print(" - " + id);
				Series s = new SeriesParser(id).getSerie();
				if (s != null)
					q.insertSeries(s);
				System.out.println("\tDONE");
			}

			System.out.println("DONE");
		} catch (FileNotFoundException e) {
			System.err.println("Missing SeriesIDs.txt");
		}

	}
}
