<!DOCTYPE HTML>
<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<% if(request.getParameter("id") == null){ %>
		<jsp:forward page="router?link=error"/>
<%}
	request.getRequestDispatcher("/router?peopleAction=getById&id="+request.
			getParameter("id")).include(request,response);
	Person p = (Person) session.getAttribute("person");
	session.removeAttribute("person");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Seriesbase - <%=p.getName() %></title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
	
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="mainHeader">
				<h1><%=p.getName()%></h1>
			</div>
			
			<div style="diplay: table;">
				<div class="personFoto">	
					<%if(p.getImageURL() != null){ %>
						<img alt="Unable to load image" src="<%=p.getImageURL()%>">
					<%}else{ %>
						<img alt="Unable to load image" src="images/unknown_person.jpg">
					<%}%>
				</div>
				
				<div class="personData">
					asdas
				</div>
			</div>
			
		</div>
				
		
		<jsp:include page="footer.jsp" />
	
	</body>
</html>