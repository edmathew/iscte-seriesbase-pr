<%@ page import="dto.Series"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	if (session.getAttribute("series") == null) {
		if (request.getParameter("id") == null)
			request.getRequestDispatcher("linkControl?link=error").forward(request, response);
		else{
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			request.getRequestDispatcher("/seriesControl?action=getyById&id="+id)
				.forward(request,response);
		}
	}

	Series s = (Series) session.getAttribute("series");
	session.removeAttribute("series");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%if(s != null) {%>
	<h1><%=s.getName()%></h1>
	
	<%} %>
</body>
</html>