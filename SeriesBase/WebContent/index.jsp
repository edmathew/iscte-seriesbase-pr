<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL") ;
	%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="styles/style.css" type="text/css" media="screen"/> 
		<link rel="stylesheet" href="styles/menu_style.css" type="text/css" />
		<title>Seriesbase - Your TV Series Database</title>
	</head>
	<body>
		
		<jsp:include page="master.jsp"/>	
		
		<div class="news">
		<%-- <ul>
			<li>The time is now <%=new java.util.Date()%></li>
		</ul> --%>
	
			</div>
	
		<div class=footer>
		</div>
		
	</body>
</html>