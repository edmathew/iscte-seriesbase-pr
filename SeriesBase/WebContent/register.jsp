<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	boolean duplicatedUsername = session.getAttribute("duplicatedUsername")!= null;
	boolean invalidUsername = session.getAttribute("invalidUsername") != null;
	String username = duplicatedUsername ? (String) session.getAttribute("duplicatedUsername") : 
			invalidUsername ? (String)session.getAttribute("invalidUsername") : "";
	
	boolean duplicatedEmail = session.getAttribute("duplicatedEmail") != null;
	boolean invalidEmail = session.getAttribute("invalidEmail") != null;
	
	String email = duplicatedEmail ? (String) session.getAttribute("duplicatedEmail") : 
		invalidEmail ? (String) session.getAttribute("invalidEmail") : "";
	
	boolean invalidPassword = session.getAttribute("invalidPassword") != null;
	boolean invalidMatch = session.getAttribute("invalidMatch") != null;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="../styles/style.css" type="text/css" media="screen"/> 
		<title>Seriesbase - Register</title>
		
		<jsp:include page="headerLinks.jsp"/>
		<script src="scripts/jquery.tools.min.js"></script>
	</head>
		
	<body>
		<div class="container">
			<jsp:include page="menu.jsp" />
			<div class="registerForm">
				<p class="title">Register at Seriesbase</p>
				<form id="registerForm" name="registerForm" action="router?userAction=register" method="post">
					<div class="field">
						<label>Username</label>
						<label class="warning"><%=duplicatedUsername ? "Username already in the system" : 
								invalidUsername ? "Invalid Username": "" %></label>
						<input type="text" name="username" size="30" value="<%=username %>" title="Must be at least 3 characters."/>
					</div>
					
					<div class="field">
						<label>E-Mail</label>
						<label class="warning"><%=duplicatedEmail ? "E-Mail already in the system" : 
								invalidEmail ? "Invalid Email":"" %></label>
						<input type="email" name="email" size="30" value="<%=email%>" title="Mandatory"/>
					</div>
					
					<div class="field">
						<label>Password</label>
						<label class="warning"><%=invalidPassword ? "InvalidPassword" : "" %></label>
						<input type="password" name="password" size="30" title="Must be at least 5 characters."/>
					</div>
					
					<div class="field">
						<label>Repeat Password</label>
						<label class="warning"><%=invalidMatch ? "Passwords must match" : "" %></label>
						<input type="password" name="repeatPassword" size="30" title="Repeat the password"/>
					</div>
					
								
					<p class="submitButton"><input type="submit" value="Register" style="height: 25px; width: 100px;" title="Register"/></p>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
		<script type="text/javascript">
			$("#registerForm :input").tooltip({
				// place tooltip on the right edge
				position: "center right",
				// a little tweaking of the position
				offset: [-2, 10],
				// use the built-in fadeIn/fadeOut effect
				effect: "fade",
				// custom opacity setting
				opacity: 0.7
			});
		</script>
		
	</body>
</html>
<%
	/*Clean the session control variables  */
	session.removeAttribute("duplicatedUsername");
	session.removeAttribute("invalidUsername");
	session.removeAttribute("duplicatedEmail");
	session.removeAttribute("invalidEmail");
	session.removeAttribute("invalidPassword");
	session.removeAttribute("invalidMatch");
%>