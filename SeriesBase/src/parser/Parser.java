package parser;

import java.io.IOException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

public class Parser {

	private Document doc;
	private XPath xpath;
	private XPathExpression exp;

	public Parser(String uri) {
		DocumentBuilderFactory b = DocumentBuilderFactory.newInstance();
		b.setNamespaceAware(true);
		try {
			doc = b.newDocumentBuilder().parse(uri);
		} catch (SAXException e) {
		} catch (IOException e) {
		} catch (ParserConfigurationException e) {
		}

		xpath = XPathFactory.newInstance().newXPath();
	}

	public Object evaluate(String expression, QName constants)
			throws XPathExpressionException {
		exp = xpath.compile(expression);
		return exp.evaluate(doc, constants);
	}
}
