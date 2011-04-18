<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="styles/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="styles/menu_style.css" type="text/css" />
<title>Seriesbase - Your TV Series Database</title>
</head>
<body>

	<jsp:include page="master.jsp" />

	<div class="news">
		<%-- <ul>
			<li>The time is now <%=new java.util.Date()%></li>
		</ul> --%>

	</div>


	<div class="wrapper">
		<p>Your website content here.</p>
		<div class="push"></div>
	</div>
	<div class=footer>
		<td align="center">
			<table align="center" border="0" width="960">
				<tr>
					<td align="left" width="200"><a
						href="http://www.w3schools.com"><img border="0"
							src="/images/w3schoolscom_gray.gif" alt="W3Schools.com" /> </a></td>
					<td align="right"
						style="word-spacing: 6px; font-size: 80%; padding-right: 10px;">
						<a href="/default.asp" target="_top">HOME</a> | <a href="#top"
						target="_top">TOP</a> | <a href='/css/css_dont.asp?output=print'
						target="_blank">PRINT</a> | <a href="/forum/default.asp"
						target="_blank">FORUM</a> | <a href="/about/default.asp"
						target="_top">ABOUT</a></td>
				</tr>

				<tr>
					<td valign="top" colspan="2" align="center" style="color: #404040;">
						<a href="" onclick="displayError();return false">Help
							W3Schools. Suggest corrections to this page.</a></td>
				</tr>
				<tr>

					<td valign="top" colspan="2" align="center"
						style="padding-top: 7px; color: #404040;">W3Schools is
						optimized for learning, testing, and training. Examples might be
						simplified to improve reading and basic understanding.<br />
						Tutorials, references, and examples are constantly reviewed to
						avoid errors, but we cannot warrant full correctness of all
						content.<br /> While using this site, you agree to have read and
						accepted our <a href="/about/about_copyright.asp">terms of use</a>
						and <a href="/about/about_privacy.asp">privacy policy</a>.<br />
						<a href="/about/about_copyright.asp">Copyright 1999-2011</a> by
						Refsnes Data. All Rights Reserved.</td>

				</tr>
			</table> <br /></td>

	</div>
</body>
</html>