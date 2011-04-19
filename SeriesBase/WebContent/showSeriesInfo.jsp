<%@ page import="dto.Series"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	Series s = (Series) session.getAttribute("series");
	if (request.getHeader("Referer") == null && request.getParameter("id")==null) {
%>
		<jsp:forward page="linkControl?link=error"/>
<%	
	}else{
		int id = Integer.parseInt(request.getParameter("id"));
		if(session.getAttribute("series") == null || s.getId() != id )
			request.getRequestDispatcher("/seriesControl?action=getById&id="+id)
					.forward(request,response);
		} 
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Serie Page</title>
		<link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
	</head>
	<body>
		<div class="seriesInfo">
			<h1><%=s.getName()%></h1>
			<%=s.getImageURL() %><br/>
			<img alt="Image not found" src="<%=s.getImageURL()%>"/>
		</div>
	</body>
</html>
