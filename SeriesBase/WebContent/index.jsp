<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="dto.Series"%>
<%
	session.setAttribute("menu", new String("home"));
	/* request.getRequestDispatcher(
			"/seriesControl?action=getById&id="
					+ request.getParameter("id")).include(request,
			response);
	 */Series s = (Series) session.getAttribute("series");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SeriesBase - Your TV Series Database Where You Can Find
	It All</title>
<jsp:include page="headerLinks.jsp" />
</head>
<body>

	<div class="container">
			<%--<jsp:include page="menu.jsp" />
			<%
				for(int i = 0; i< 20; i++)
					out.println(i+"<br />");
			%>
		</div> --%>
	<jsp:include page="menu.jsp" />
	<div class="mainContainer">
		<div class="mainHeader">
			<h1 class="mainHeader">What's new?</h1>
		</div>
		<div class="mainLeft">
				<img src="images/episodes.jpg" alt=""  />
		</div>
		<div class="mainContent">
			<h2>EPISODES</h2>
			<p>Matt LeBlanc returns to TV this weekend with Episodes, a new
				Showtime series in which he plays himself as the star of a
				disastrous American adaptation of a British sitcom. Read on for my
				review of the show's first season, which premieres Sunday night at
				9:30 p.m. EST.</p>
		</div>

	</div>
	</div>

	<jsp:include page="footer.jsp" />


</body>
</html>