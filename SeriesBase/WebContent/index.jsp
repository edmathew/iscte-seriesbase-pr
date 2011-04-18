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
		<title>Seriesbase - Your TV Series Database</title>
	</head>
	<body>
		<jsp:include page="master.jsp"/>
		
		<div class="news">
		<ul>
			<li>The time is now <%=new java.util.Date()%></li>
		</ul>
	
		<%
			if (!logged) {
		%>
		
		<%
			if (bruteForce) {
					session.removeAttribute("bruteForceLogin");
		%>
		<p style="color: red; size: 20px">Dados incorrectos. Tente outra
			vez.</p>
		<%
			}
		%>
	
		<a href="forms/register.jsp">Registar</a>
		<%
			} else {
		%>
		<p>
			Welcome
			<%=session.getAttribute("loginname").toString()%></p>
		<a href="logout.jsp">LogOut</a>
		<%
			}
		%>
		</div>
	
		<div class=footer>
		</div>
		
	</body>
</html>