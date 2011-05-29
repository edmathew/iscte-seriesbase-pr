<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dto.Series"%>
<%
	session.setAttribute("menu", new String("home"));

	request.getRequestDispatcher("/router?seriesAction=getById&id=5").include(request,response);
	Series s = new Series((Series) session.getAttribute("series"));
	request.getRequestDispatcher("/router?seriesAction=getById&id=5")
		.include(request,response);
	Series s1 = new Series((Series) session.getAttribute("series"));
	
	request.getRequestDispatcher("/router?seriesAction=getById&id=18")
		.include(request,response);
	Series s2 = new Series((Series) session.getAttribute("series"));
	
	request.getRequestDispatcher("/router?seriesAction=getById&id=50")
		.include(request,response);
	Series s3 = new Series((Series) session.getAttribute("series"));
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
				<img src="<%out.println(s1.getImageURL());%>" />
			</div>
			<div class="mainContent">
				<h2><%=s1.getName()%></h2>
				<hr />
				<div class="mainText"><%=s1.getResumo()%><p></p><p></p></div>
				<div class="mainVideo">
					<object width="292" height="200">
						<param name="movie"
							value="http://www.youtube.com/v/z4yH0mI-yJs?fs=1"></param>
						<param name="allowFullScreen" value="true"></param>
						<param name="allowScriptAccess" value="always"></param>
						<embed src="http://www.youtube.com/v/z4yH0mI-yJs?fs=1"
							type="application/x-shockwave-flash" allowfullscreen="true"
							allowscriptaccess="always" width="292" height="200">
						</embed>
					</object>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		
		
		<div class="mainNews">
			<div class="mainImg">
				<img src="<%=s2.getImageURL()%>" />
			</div>
			<div class="mainContent">
				<h2><%=s2.getName()%></h2>
				<hr />
				<div class="mainText"><%=s2.getResumo()%></div>
				<div class="mainVideo">
					<object width="292" height="200">
						<param name="movie"
							value="http://www.youtube.com/v/TqYX-qI9oxw?fs=1"></param>
						<param name="allowFullScreen" value="true"></param>
						<param name="allowScriptAccess" value="always"></param>
						<embed src="http://www.youtube.com/v/TqYX-qI9oxw?fs=1"
							type="application/x-shockwave-flash" allowfullscreen="true"
							allowscriptaccess="always" width="292" height="200">
						</embed>
					</object>
				</div>
			</div>
			
			<div class="clear"></div>
		</div>
		
		<div class="mainNews">
			<div class="mainImg">
				<img src="<%=s3.getImageURL()%>" />
			</div>
			<div class="mainContent">
				<h2><%=s3.getName()%></h2>
				<hr />
				<div class="mainText"><%=s3.getResumo()%><p></p><p></p></div>
				<div class="mainVideo">
					<object width="292" height="200">
						<param name="movie"
							value="http://www.youtube.com/v/ud8AJDaAW7c?fs=1"></param>
						<param name="allowFullScreen" value="true"></param>
						<param name="allowScriptAccess" value="always"></param>
						<embed src="http://www.youtube.com/v/ud8AJDaAW7c?fs=1"
							type="application/x-shockwave-flash" allowfullscreen="true"
							allowscriptaccess="always" width="292" height="200">
						</embed>
					</object>
				</div>
			</div>
			
			<div class="clear"></div>
		</div>
		
</div>
		<jsp:include page="footer.jsp" />
</body>
</html>
<%
	session.removeAttribute("series");
%>