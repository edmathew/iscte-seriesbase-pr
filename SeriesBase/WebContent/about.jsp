<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	session.setAttribute("menu", new String("about")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About</title>
<jsp:include page="headerLinks.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<%-- <div class="contents">
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
		</div> --%>

		<div id="footer-spacer"></div>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>