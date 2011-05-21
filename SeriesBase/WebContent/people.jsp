<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    	session.setAttribute("menu", new String("people"));
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Seriesbase - People</title>
		<jsp:include page="headerLinks.jsp"/>
		<script type="text/javascript" src="scripts/jquery-1.6.1.min.js"></script>
	</head>
	<body>
	 	
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="peopleSearch">
				<p class="noBreak">Search</p>
					<input type="text"  name="personFilter" size="80" />
					<input type="submit" value ="Go" id="go" class="inputClass"/>
				
				<div class="results" id="resultsDiv">
					Resultados
				</div>
				
			</div>
				
		</div>
		<jsp:include page="footer.jsp" />
		
	
	</body>
</html>