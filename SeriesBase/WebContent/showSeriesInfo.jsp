<!DOCTYPE HTML>
<%@page import="dto.Episodio"%>
<%@ page import="dto.Series"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<% if(request.getParameter("id") == null){ %>
		<jsp:forward page="linkControl?link=error"/>
<%}
	request.getRequestDispatcher("/seriesControl?action=getById&id="+request.getParameter("id")).include(request,response);
	Series s = (Series) session.getAttribute("series");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Seriesbase - <%=s.getName() %></title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
	
		<div class="container">
			<jsp:include page="header.jsp" />
			<div class="contents">
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
				<div class="episodesTable">
					<table border="1" id="s1">
						<%
							for (int i = 0; i < s.getEpisodes().size(); i++) {
								Episodio e = (Episodio) s.getEpisodes().get(i);
						%>
						<tr>
							<td><%=e.getTemporada()%></td>
							<td><%=e.getNumero()%></td>
							<td><%=e.getTitulo()%></td>
							<td><%=e.getOverview()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>

		</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>
