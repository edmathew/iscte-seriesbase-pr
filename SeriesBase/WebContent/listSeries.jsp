<!DOCTYPE HTML>

<%@page import="dto.Series"%>
<%@ page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	
	session.setAttribute("menu", new String("series"));

	request.getRequestDispatcher("/router?seriesAction=getAll").include(request,response);
	Object[] series = (Object[]) session.getAttribute("seriesList");
	session.removeAttribute("seriesList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SeriesBase - Series</title>
<jsp:include page="headerLinks.jsp" />
</head>

<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div class="mainHeader">
			<h1>Find a new Series to Watch</h1>
		</div>
		<div style="display: table; width: 100%;">
			<div class="seriesLineHeader">
				<div class="infoName">Name</div>
				<div class="infoYear">Year</div>
				<div>Network</div>
				<hr />
			</div>
			
			<%
					for (int i = 0; i < series.length; i++) {
							Series s = (Series) series[i];
				%>
			<div class="seriesLine">
				<div class="infoName">
					<a class="thumbnail"
						href="router?link=getSeriesById&id=<%=s.getId()%>"> <%=s.getName()%> 
						<span> <img src="<%=s.getImageURL()%>" width="300px" height="400px" border="0"> <br>
							<%=s.getName()%> </span> </a>
				</div>
				<div class="infoYear"><%=s.getAnoInicial()%></div>
				<div><%=s.getNetwork()%></div>
			</div>


			<%} %>

		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>