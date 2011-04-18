package dto;

import java.util.Date;

public class Episodio {

	private int numero;
	private int temporada;
	private String titulo;
	private Date dateExibicao;

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

	private String overview;

	public Episodio(int numero, int temporada, String titulo,
			Date dateExibicao, String overview) {
		this.numero = numero;
		this.temporada = temporada;
		this.titulo = titulo;
		this.dateExibicao = dateExibicao;
		this.overview = overview;
	}

	@Override
	public String toString() {
		return "S" + temporada + "E" + numero + " - " + titulo + "\n";
	}

}
