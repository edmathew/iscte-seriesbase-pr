<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<%if(session.getAttribute("loginID")!= null){ %>
			<meta http-equiv="refresh" content="3;url=index.jsp" /> 
		<%} %>
		<title>Seriesbase - Login Page</title>
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
	
		<div class="container">
			<jsp:include page="menu.jsp" />
			<%if(session.getAttribute("loginID")== null){%>
				<div class="loginForm">
					O recurso pretendido n�o est� disponivel para utilizadores anonimos.
					<form method="post" action="router?action=login">
						<label>Username: </label>
						<input type="text" name="log" id="log" size="23" />
						<label>Password: </label>
						<input type="password" name="pwd" id="pwd" size="23" />
						<input type="submit" value="Log In"/>
					</form>
				</div>
			<%}else{ %>
				<div class="loginForm">
					You are already logged.
				</div>
			<%} %>
		</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>