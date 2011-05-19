<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%if(session.getAttribute("loginID") == null)
	response.sendRedirect("router?link=login");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Seriesbase - User Control Panel</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
	
		<div class="container">
			<jsp:include page="menu.jsp" />
			
				
		</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>