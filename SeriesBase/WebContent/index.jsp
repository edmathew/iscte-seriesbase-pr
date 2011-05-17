<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	session.setAttribute("menu", new String("home"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SeriesBase - Your TV Series Database Where You Can Find
	It All</title>
<jsp:include page="headerLinks.jsp" />
</head>
<body>

	<%-- <div class="container">
			<jsp:include page="menu.jsp" />
			<%
				for(int i = 0; i< 20; i++)
					out.println(i+"<br />");
			%>
		</div> --%>
	<jsp:include page="menu.jsp" />
	<div class="mainContainer">
		<div class="mainHeader">
			<h1 class="mainHeader">Texto1</h1>
		</div>
		<div class="mainLeft">
			<p>"Never increase, beyond what is necessary, the number of
				entities required to explain anything." William of Ockham
				(1285-1349)</p>
		</div>
		<div class="mainContent">
			<h2>Free Web Building Tutorials</h2>
			<p>At W3Schools you will find all the Web-building tutorials you
				need, from basic HTML and XHTML to advanced XML, XSL, Multimedia and
				WAP.</p>
			<p>W3Schools - The Largest Web Developers Site On The Net!</p>
		</div>
		
	</div>

	<jsp:include page="footer.jsp" />


</body>
</html>