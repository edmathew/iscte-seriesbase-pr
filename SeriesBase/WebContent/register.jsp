<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	boolean duplicatedUsername = session.getAttribute("duplicatedUsername")!= null;
	boolean duplicatedEmail = session.getAttribute("duplicatedEmail") != null;
	boolean validPassword = session.getAttribute("validPassword") != null;
	boolean postBack = duplicatedEmail || duplicatedUsername;
	String username = null, email = null, birth = null, imageURL = null;
	if(duplicatedUsername){
		session.removeAttribute("duplicatedUsername");
		session.removeAttribute("duplicatedEmail");
		username = (String)session.getAttribute("username");
		email = (String)session.getAttribute("email");
		birth = (String)session.getAttribute("birth");
		imageURL = (String)session.getAttribute("imageURL");
		session.removeAttribute("username");
		session.removeAttribute("email");
		session.removeAttribute("birth");
		session.removeAttribute("imageURL");
	}
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
				<form id="registerForm" name="registerForm" action="router?action=register" method="post">
					<div class="field">
						<label>Username</label>
						<label class="warning"><%=duplicatedUsername ? "Username already in the system" : "" %></label>
						<input type="text" name="username" size="30" value="<%=postBack ? username : "" %>" title="Must be at least 3 characters."/>
					</div>
					
					<div class="field">
						<label>E-Mail</label>
						<label class="warning"><%=duplicatedEmail ? "E-Mail already in the system" : "" %></label>
						<input type="email" name="email" size="30" value="<%=postBack ? email : "" %>" title="Mandatory"/>
					</div>
					
					<div class="field">
						<label>Password</label>
						<label class="warning"><%=duplicatedEmail ? "E-Mail already in the system" : "" %></label>
						<input type="password" name="password" size="30" title="Must be at least 5 characters."/>
					</div>
					
					<div class="field">
						<label>Repeat Password</label>
						<label class="warning"><%=duplicatedEmail ? "E-Mail already in the system" : "" %></label>
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