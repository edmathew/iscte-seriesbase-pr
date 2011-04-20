<%@ page import="dto.Series"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<% if(request.getParameter("id") == null){ %>
		<jsp:forward page="linkControl?link=error"/>
<%}
	request.getRequestDispatcher("/seriesControl?action=getById&id="+request.getParameter("id")).include(request,response);
	Series s = (Series) session.getAttribute("series");
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><%=s.getName() %> Info Page</title>
		<link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
	</head>
	<body>
		<div>
			<h1><%=s.getName()%></h1>
			<div class="seriesImage">
				<img alt="Image not found" src="<%=s.getImageURL()%>">
			</div>
			<div class="seriesInfo">
				<b>Premiere Year</b><br/>
				<%=s.getAnoInicial() %><br/><br/>
				<b>Overview</b><br/>
				<%=s.getResumo() %><br /><br />
				<b>Network</b><br/>
				<%=s.getNetwork() %><br/><br/>
				<b>Genres</b><br/>
				<%=s.getGenres() %><br/><br/>
				<b>Actors</b><br/>
				<%=s.getActors() %><br/><br/>
				
				
			</div>
		</div>
	</body>
</html>
