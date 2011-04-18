package dto;

import java.util.LinkedList;

public class Series {

	private String name;
	private int anoInicial;
	private String resumo;
	private String network;
	private String imageURL;

	private LinkedList<Person> actors = new LinkedList<Person>();
	private LinkedList<String> genres = new LinkedList<String>();
	private LinkedList<Episodio> episodes = new LinkedList<Episodio>();

	public Series(String nome, int anoInicial, String resumo,
			String network, LinkedList<Person> actors, LinkedList<String> genres) {
		this.name = nome;
		this.anoInicial = anoInicial;
		this.resumo = resumo;
		this.actors = actors;
		this.genres = genres;
		this.network = network;
	}

	public void setEpisodes(LinkedList<Episodio> episodes) {
		this.episodes = episodes;
	}

	public LinkedList<Episodio> getEpisodes() {
		return episodes;
	}

	public String getName() {
		return name;
	}

	public int getAnoInicial() {
		return anoInicial;
	}

	public String getResumo() {
		return resumo;
	}

	public String getNetwork() {
		return network;
	}

	public LinkedList<Person> getActors() {
		return actors;
	}

	public LinkedList<String> getGenres() {
		return genres;
	}

	@Override
	public String toString() {
		return "Serie [nome=" + name + ", anoInicial=" + anoInicial+", resumo=" + resumo + ", network="
				+ network + ", actors=" + actors + ", genres=" + genres
				+ ", episodes=" + episodes + "]";
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getImageURL() {
		return imageURL;
	}
}
