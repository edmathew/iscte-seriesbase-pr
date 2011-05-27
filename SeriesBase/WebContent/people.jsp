<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="dto.Person"%>
<%
    session.setAttribute("menu", new String("people"));
	request.getRequestDispatcher("/router?peopleAction=getAll").include(request,response);
	Object[] list = (Object[]) session.getAttribute("personsList");
	session.removeAttribute("personsList");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Seriesbase - People</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="peopleSearch">
				<p class="noBreak">Search</p>
					<input type="text"  id="personFilter" size="80" />
					<button>Go</button>
								
				<%
					for(int i= 0; i < list.length; i++){
						Person p = (Person) list[i];
				%>
					
					<div class="results" id="<%=p.getName()%>">
						<b><%=p.getName() %></b>
					</div>
				<%} %>
			</div>
			
		
		</div>
		<jsp:include page="footer.jsp" />
		<script type="text/javascript">
			jQuery('button').click(function () {
				
				//jQuery(".results").toggle("slow");
				//jQuery(".results").hide("slow");
				jQuery('.results').each(function(el){
					var text = document.getElementById('personFilter').value.toLowerCase();
					
					if(jQuery(this).attr("id").search(text)!= -1)
						jQuery(this).show("slow");
					else
						jQuery(this).hide("slow");
			
				});
			});   
			
		</script>
		
	
	</body>
</html>