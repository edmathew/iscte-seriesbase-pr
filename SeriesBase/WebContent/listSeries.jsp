<%@page import="dto.Series"%>
<%@page import="java.util.LinkedList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (session.getAttribute("seriesList") == null)
		request.getRequestDispatcher("/seriesControl?action=getAll")
				.forward(request, response);

	Object[] series;
	//if (session.getAttribute("seriesList") != null)
		series = (Object[]) session.getAttribute("seriesList");
	//else
		//series = new Object[0];
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<table border="1" id="s1">
		<%
			for (int i = 0; i < series.length; i++) {
				Series s = (Series) series[i];
		%>
		<tr>
			<td><%=s.getName()%></td>
			<td><%=s.getAnoInicial()%></td>
			<td><a href="seriesControl?action=getById&id=<%=s.getId()%>">Page</a>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>