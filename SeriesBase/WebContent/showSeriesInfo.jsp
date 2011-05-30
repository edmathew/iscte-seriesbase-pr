<!DOCTYPE HTML>

<%@page import="dto.Episodio"%>
<%@page import="dto.Series"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<% if(request.getParameter("id") == null){ %>
		<jsp:forward page="router?link=error"/>
<%}
	request.getRequestDispatcher("/router?seriesAction=getById&id="+request.getParameter("id")).include(request,response);
	Series s = (Series) session.getAttribute("series");
	boolean isFavorite = false;
	if(session.getAttribute("isFavorite") != null){
		isFavorite = true;
		session.removeAttribute("isFavorite");
	}
%>
<html>
	<head>
		<title>Seriesbase - <%=s.getName() %></title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	
	<body>
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="mainHeader">
				<h1><%=s.getName()%></h1>
			</div>
			
			<div style="display: table">
				<div class="seriesImage">
					<img alt="Image not found" src="<%=s.getImageURL()%>">
				</div>
				
				<div class="seriesInfo">
						<div class="favoriteState">
							<%if(!isFavorite){%>
										<a href="router?seriesAction=addToFavorites">
											<img src="images/favorite.png">
											Add to Favorites
										</a>
									<%}else{%>
										<img alt="" src="images/Yes_check.png" />
										Favorite
							<%} %>
						</div>
					
					<div class="seriesDescription">
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
				
			</div>
				</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>
