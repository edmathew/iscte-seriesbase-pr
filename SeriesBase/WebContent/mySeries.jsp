<!DOCTYPE HTML>

<%@page import="dto.Series"%>
<%@ page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%	session.setAttribute("menu", new String("mySeries"));%>
<%
	request.getRequestDispatcher("/router?seriesAction=getByUserId").include(request,response);
	Object[] series = (Object[]) session.getAttribute("seriesList");
	session.removeAttribute("seriesList");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>My Series</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
		<div class="container">
			<jsp:include page="menu.jsp" />
				<div class="contents">
				<table border="1" id="s1">
					<%
						for (int i = 0; i < series.length; i++) {
							Series s = (Series) series[i];
					%>
					<tr>
						<td><%=s.getName()%></td>
						<td><%=s.getAnoInicial()%></td>
						<td><a href="linkControl?link=getSeriesById&id=<%=s.getId()%>">Page</a>
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