package dto;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Episodio implements Serializable{

	private int id;
	private int numero;
	private int temporada;
	private String titulo;
	private Date dateExibicao;
	private String overview;

	public Episodio(int numero, int temporada, String titulo,
			Date dateExibicao, String overview) {
		this.numero = numero;
		this.temporada = temporada;
		this.titulo = titulo;
		this.dateExibicao = dateExibicao;
		this.overview = overview;
	}
	
	public Episodio(int id, int numero, int temporada, String titulo,
			Date dateExibicao, String overview) {
		this.id = id;
		this.numero = numero;
		this.temporada = temporada;
		this.titulo = titulo;
		this.dateExibicao = dateExibicao;
		this.overview = overview;
	}
	
	public int getId() {
		return id;
	}

	public int getNumero() {
		return numero;
	}

	public int getTemporada() {
		return temporada;
	}

	public String getTitulo() {
		return titulo;
	}

	public Date getDateExibicao() {
		return dateExibicao;
	}

	public String getOverview() {
		return overview;
	}

	@Override
	public String toString() {
		return "S" + temporada + "E" + numero + " - " + titulo + "\n";
	}

}
