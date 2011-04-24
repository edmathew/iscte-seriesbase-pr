package dto;

public class Genre {

	private int id = -1;
	private String name;

	public Genre(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Genre(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

}
