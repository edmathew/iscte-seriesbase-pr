package parser;

import java.text.ParseException;
import java.util.Date;
import java.util.LinkedList;

import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;

import org.w3c.dom.DOMException;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import dto.*;

import utilities.Utilities;

public class SeriesParser {

	private Parser p;
	private int tvDB_ID;
	private static final String BANNER_URL = "http://cache.thetvdb.com/banners/";

	public SeriesParser(int tvDB_ID) {
		this.tvDB_ID = tvDB_ID;
		p = new Parser(getURL(tvDB_ID));
	}

	public SeriesParser(String url) {
		p = new Parser(url);
	}

	private static String getURL(int tvDB_ID) {
		return "http://cache.thetvdb.com/api/61512BD7136BE55F/series/"
				+ tvDB_ID + "/all/en.xml";
	}

	public static LinkedList<String> splitNames(String text) {
		LinkedList<String> names = new LinkedList<String>();
		text = text.replace('|', '-');
		String[] split = text.split("-");
		for (int i = 1; i < split.length; i++)
			names.add(split[i]);

		return names;
	}

	public static LinkedList<Person> getActors(String text) {
		LinkedList<Person> actors = new LinkedList<Person>();
		if (text != null) {
			text = text.replace('|', '-');
			String[] names = text.split("-");
			for (int i = 1; i < names.length; i++)
				actors.add(new Person(names[i]));
		}
		return actors;
	}

	private Node getNode(NodeList list, String name) {
		for (int i = 0; i < list.getLength(); i++)
			if (name.equals(list.item(i).getLocalName()))
				return list.item(i);

		return null;
	}

	public Series getSerie() {
		NodeList nodes;
		try {
			nodes = (NodeList) p.evaluate("//Series/*", XPathConstants.NODESET);
		} catch (XPathExpressionException e) {
			System.err.println("Error parsing " + tvDB_ID);
			return null;
		}

		LinkedList<Person> actors = getActors(getNode(nodes, "Actors")
				.getTextContent());
		int sYear = -1;
		try {
			sYear = Integer.parseInt(getNode(nodes, "FirstAired")
					.getTextContent().substring(0, 4));
		} catch (Exception e) {
		}
		LinkedList<String> genres = splitNames(getNode(nodes, "Genre")
				.getTextContent());
		String network = getNode(nodes, "Network").getTextContent().trim();
		String overview = getNode(nodes, "Overview").getTextContent().trim();
		String name = getNode(nodes, "SeriesName").getTextContent().trim();
		String imageURL = getNode(nodes, "poster").getTextContent().trim();

		Series s = new Series(name, sYear, overview, network, actors, genres);

		LinkedList<Episodio> eps = new LinkedList<Episodio>();

		int i = 1;
		do {
			try {
				nodes = (NodeList) p.evaluate("//Episode[" + i + "]",
						XPathConstants.NODE);
			} catch (XPathExpressionException e) {
			}

			if (nodes != null && nodes.getLength() == 53) {
				eps.add(getEpisodio(nodes));
			}
			i++;
		} while (nodes != null);

		if (!imageURL.equals(""))
			s.setImageURL(BANNER_URL + imageURL);

		s.setEpisodes(eps);
		return s;
	}

	private Episodio getEpisodio(NodeList list) {
		int numero = (int) Math.round(Double.parseDouble(getNode(list,
				"Combined_episodenumber").getTextContent()));
		int temporada = Integer.parseInt(getNode(list, "Combined_season")
				.getTextContent());
		String title = getNode(list, "EpisodeName").getTextContent();
		Date d = null;
		try {
			d = Utilities.parseDate(getNode(list, "FirstAired")
					.getTextContent(), "yyyy-MM-dd");
		} catch (DOMException e) {
		} catch (ParseException e) {
		} catch (IllegalArgumentException e) {
		}

		String overview = getNode(list, "Overview").getTextContent();
		return new Episodio(numero, temporada, title, d, overview);
	}
}
