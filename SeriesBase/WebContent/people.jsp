<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    	session.setAttribute("menu", new String("people"));
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
					<input type="text"  name="personFilter" size="80" />
					<button>Go</button>
				
				<div class="results" id="resultsDiv">
					Resultados1
				</div>
				<div class="results" id="resultsDiv2">
					Resultados2
				</div>
			</div>
				
		</div>
		<jsp:include page="footer.jsp" />
		<script type="text/javascript">
			jQuery("button").click(function () {
				jQuery(".results").toggle("slow");
			});   
			
		</script>
		
	
	</body>
</html>