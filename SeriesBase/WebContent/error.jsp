<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<jsp:include page="headerLinks.jsp"/>
		<title>Error</title>
	</head>
	<body>
	<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="errorLog">
				<p>It wasn't possible to reach the resource you were searching!</p>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</body>
</html>