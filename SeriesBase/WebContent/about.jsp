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
				<h2>Nuno Dias</h2>
				<p>Estudante Finalista de Engenharia Informática no ISCTE-IUL</p>
				<p>Residente em Lisboa, 25 anos</p>
			</div>
		</div>
		<div class="GeneralProfile">
			<div class="Photo">
				<img src="images/edgarmateus.png" alt="" />
			</div>
			<div class="Content">
				<h2>Edgar Mateus</h2>
				<p>Estudante Finalista de Engenharia Informática no ISCTE-IUL</p>
				<p>Residente em Arruda dos Vinhos, 20 anos</p>
			</div>
		</div>
		<div class="GeneralProfile">
			<div class="Photo">
				<img src="images/tiagoamaral.png" alt="" />
			</div>
			<div class="Content">
				<h2>Tiago Amaral</h2>
				<p>Estudante Finalista de Engenharia Informática no ISCTE-IUL</p>
				<p>Residente em Sintra, 23 anos</p>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>