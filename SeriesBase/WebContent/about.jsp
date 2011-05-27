<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	session.setAttribute("menu", new String("about"));
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SeriesBase - About</title>
<jsp:include page="headerLinks.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div class="mainHeader">
			<h1>Who are We?</h1>
		</div>

		<div class="GeneralProfile">
			<div class="Photo">
				<img src="images/nunodias.png" alt="" />
			</div>
			<div class="Content">
				<h2>Nuno Description</h2>
				<p>texto do nuno</p>
			</div>
		</div>
		<div class="GeneralProfile">
			<div class="Photo">
				<img src="images/edgarmateus.png" alt="" />
			</div>
			<div class="Content">
				<h2>Edgar Description</h2>
				<p>Texto do edgar</p>
			</div>
		</div>
		<div class="GeneralProfile">
			<div class="Photo">
				<img src="images/tiagoamaral.png" alt="" />
			</div>
			<div class="Content">
				<h2>Tiago Description</h2>
				<p>texto do tiago</p>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>