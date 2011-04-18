package dto;

/**
 * Represents a Person.
 * 
 * @author Ed Mateus
 * @version April 2011
 * 
 */
public class Person {

	private int id = -1;
	private String name;
	private String imageURL;

	public Person(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Person(String name) {
		this.name = name;
	}

	public Person(int id, String name, String imageURL) {
		this.id = id;
		this.name = name;
		this.imageURL = imageURL;
	}

	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

	public String getImageURL() {
		return imageURL;
	}

	@Override
	public String toString() {
		return name;
	}
}
