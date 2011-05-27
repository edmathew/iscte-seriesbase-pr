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
		<jsp:include page="menu.jsp" />
		<div class="mainHeader">
			<h1 class="mainHeader">What's new?</h1>
		</div>
		<div class="mainNews">
			<div class="mainImg">
				<h2>EPISODES</h2>
				<img src="images/episodes.jpg" />
			</div>
			<div class="mainContent">
				<div class="mainText">Matt LeBlanc returns to TV this weekend
					with Episodes, a new Showtime series in which he plays himself as
					the star of a disastrous American adaptation of a British sitcom.
					Read on for my review of the show's first season, which premieres
					Sunday night at 9:30 p.m. EST.</div>
				<div class="mainVideo">
					<object width="225" height="144">
						<param name="movie"
							value="http://www.youtube.com/v/z4yH0mI-yJs?fs=1"></param>
						<param name="allowFullScreen" value="true"></param>
						<param name="allowScriptAccess" value="always"></param>
						<embed src="http://www.youtube.com/v/z4yH0mI-yJs?fs=1"
							type="application/x-shockwave-flash" allowfullscreen="true"
							allowscriptaccess="always" width="225" height="144">
						</embed>
					</object>
				</div>
			</div>
			<div class="clear"></div>
		</div>

		<jsp:include page="footer.jsp" />
</body>
</html>