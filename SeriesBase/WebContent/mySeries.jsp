<!DOCTYPE HTML>

<%@page import="exceptions.NoLoginException"%>
<%@page import="dto.Series"%>
<%@ page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%	session.setAttribute("menu", new String("mySeries"));%>

<%
	boolean logged = session.getAttribute("loginID") != null;
	Object[] series = new Object[0];
	
	if(!logged){
		session.setAttribute("tempAddress", "mySeries.jsp");
		response.sendRedirect("router?link=login");
	}else{
		request.getRequestDispatcher("/router?seriesAction=getByUserId").include(request,response);
		series = (Object[]) session.getAttribute("seriesList");
		session.removeAttribute("seriesList");
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
			<div style="display: table">
				<%
					for (int i = 0; i < series.length; i++) {
							Series s = (Series) series[i];
				%>
				<div class="seriesLine">
					sere
				</div>
				
				
				<%} %>
				
			</div>
				<div class="contents">
				<table border="1" id="s1">
					<%
						for (int i = 0; i < series.length; i++) {
							Series s = (Series) series[i];
					%>
					<tr>
						<td><%=s.getName()%></td>
						<td><%=s.getAnoInicial()%></td>
						<td><a href="router?link=getSeriesById&id=<%=s.getId()%>">Page</a>
					</tr>
					<%
						}
					%>
				</table>
			</div>

			<div id="footer-spacer"></div>  
		</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>