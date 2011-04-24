<!DOCTYPE HTML>
<%@ page import="dto.*"%>
<%@ page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	request.getRequestDispatcher("/seriesControl?action=getAll").include(request,response);
	Object[] series = (Object[]) session.getAttribute("seriesList");
	session.removeAttribute("seriesList");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>List Series</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>

	<body>
		<jsp:include page="header.jsp"/>
		<div class="container">
			<div class="seriesTable">
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
		</div>
		
		<jsp:include page="footer.jsp"/>
	</body>
</html>