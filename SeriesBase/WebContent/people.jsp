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
			<div class="mainHeader">
				<h1>People</h1>
			</div>
			<div style="diplay: table;">
				<div class="resultsDiv">
					<%
						for(int i= 0; i < list.length; i++){
							Person p = (Person) list[i];
					%>
					
					<div class="results" id="<%=p.getName()%>">
							<a href="router?link=getPersonById&id=<%=p.getId()%>">
								<b><%=p.getName() %></b>
							</a>
						</div>
					<%} %>
				</div>
				<div class="peopleSearch">	
					<p class="noBreak">Search</p>
						<input type="text" id="personFilter" size="40" />
				</div>
				
			</div>
			<div style="clear:both;"></div>
		
		</div>
		<jsp:include page="footer.jsp" />
		
		<script type="text/javascript">
			jQuery('#personFilter').change(function(){
				var text = jQuery(this).attr("value").toLowerCase();
				if(text === "")
					jQuery('.results').each(function(){
						jQuery(this).hide();
					}); 
				else
					jQuery('.results').each(function(el){
						var idValue = jQuery(this).attr("id").toLowerCase();
						if(idValue.search(text) != -1)
							jQuery(this).show();
						else
							jQuery(this).hide();
					});					
			});
		
			jQuery('#personFilter').keydown(function(){
				var text = jQuery(this).attr("value").toLowerCase();
				if(text === "")
					jQuery('.results').each(function(){
						jQuery(this).hide();
					}); 
				else
					jQuery('.results').each(function(el){
						var idValue = jQuery(this).attr("id").toLowerCase();
						if(idValue.search(text) != -1)
							jQuery(this).show();
						else
							jQuery(this).hide();
					});					
			});
			
			jQuery('#personFilter').keypress(function(event){
				if(event.which == '13')
					jQuery('#personFilter').trigger('keydown');
			});
					
		</script>
		
	
	</body>
</html>