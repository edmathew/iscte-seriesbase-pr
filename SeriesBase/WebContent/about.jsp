<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	session.setAttribute("menu", new String("about")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

		<div class="mainHeader">
			<h1 class="mainHeader">Who are We?</h1>
		</div>
		<div class="article">
			<img src="images/episodes.jpg" alt=""  />
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