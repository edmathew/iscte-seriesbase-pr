<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%	session.setAttribute("menu", new String("home")); %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SeriesBase - Your TV Series Database Where You Can Find It All</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
	
		<%-- <jsp:include page="master.jsp" /> --%>
		
		<div class="container">
			<jsp:include page="menu.jsp" />
			<%
				for(int i = 0; i< 20; i++)
					out.println(i+"<br />");
			%>
		</div>
		<jsp:include page="footer.jsp" />
	
	
	</body>
</html>