<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	boolean fromRegister = session.getAttribute("registerDone") != null;
	boolean noLogin = session.getAttribute("tempAddress") != null;
%>

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
			<div class="mainHeader">
				<h1>Login Page</h1>
			</div>
			
			<div class="warningLog">
				<%=noLogin? "To acess this feature you need to log in":"" %>
			</div>
			<div class="confirm">
				<%=fromRegister ? "Now you can log in\n" : "" %>
			</div>
			
			<%if(session.getAttribute("loginID")== null){%>
				<div class="loginForm">
					
					<form method="post" action="router?userAction=login">
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
<%
	/*Clean the session control variables  */
	session.removeAttribute("registerDone");
%>