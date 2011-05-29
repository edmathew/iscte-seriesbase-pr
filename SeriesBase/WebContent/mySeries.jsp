<!DOCTYPE HTML>

<%@page import="exceptions.NoLoginException"%>
<%@page import="dto.Series"%>
<%@ page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%	
	session.setAttribute("menu", new String("mySeries"));

	boolean logged = session.getAttribute("loginID") != null;
	Object[] series = new Object[0];
	
	if(!logged){
		session.setAttribute("tempAddress", "mySeries.jsp");
		response.sendRedirect("router?link=login");
	}else{
		request.getRequestDispatcher("/router?seriesAction=getByUserId").include(request,response);
		if(session.getAttribute("seriesList") != null)
			series = (Object[]) session.getAttribute("seriesList");
	}
	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SeriesBase - My Series</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="mainHeader">
				<h1>Your Favorite Series</h1>
			</div>
			<div style="display: table; width: 100%;">
				<%
					for (int i = 0; i < series.length; i++) {
							Series s = (Series) series[i];
				%>
				<div class="seriesLine">
					<div class="infoName">
						<a href="router?link=getSeriesById&id=<%=s.getId()%>">
							<%=s.getName()%>
						</a>
					</div>
					<div class="infoYear"><%=s.getAnoInicial()%></div>
					<div><%=s.getNetwork()%></div>
					<div class="deleteSeries">
						<a href="router?seriesAction=removeFromFavorites&id=<%=s.getId()%>">
							<img src="images/remove.gif" title="Remove from Favorites"></a>
					</div>
				</div>
				
				
				<%} %>
				
			</div>

			<div id="footer-spacer"></div>  
		</div>
		<jsp:include page="footer.jsp" />
		<script type="text/javascript">
			jQuery(".deleteSeries:img").tooltip({
				// place tooltip on the right edge
				position: "center right",
				// a little tweaking of the position
				offset: [-2, 10],
				// use the built-in fadeIn/fadeOut effect
				effect: "fade",
				// custom opacity setting
				opacity: 0.7
			});
		</script>
		
	</body>
</html>
<%
	session.removeAttribute("seriesList");
%>