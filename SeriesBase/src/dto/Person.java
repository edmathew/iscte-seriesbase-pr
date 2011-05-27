package dto;

import java.io.Serializable;

/**
 * DTO class that represents a Person.
 * 
 * @author Edgar Mateus
 * @author Nuno Dias
 * @author Tiago Amaral
 * 
 * @version April 2011
 */
@SuppressWarnings("serial")
public class Person implements Serializable {

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
