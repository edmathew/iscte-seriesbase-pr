<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%	if(session.getAttribute("loginID") == null){
		session.setAttribute("tempAddress", "userControlPanel.jsp");
		response.sendRedirect("router?link=login");
	}

	boolean invalidEmail = session.getAttribute("invalidEmail") != null;
	boolean wrongPassword = session.getAttribute("wrongPassword") != null;
	boolean wrongMatch = session.getAttribute("wrongMatch") != null;
	boolean updateDone = session.getAttribute("updateDone") != null;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seriesbase - User Control Panel</title>
<jsp:include page="headerLinks.jsp" />
</head>
<body>

	<div class="container">
		<jsp:include page="menu.jsp" />
		<div class="coloredControPanel">
			<h1>Control Panel</h1>
		</div>
			<%	if(updateDone){ %>
			<p>Changes saved</p>
			<!--  <script type="text/javascript">
								alert("Changes saved!");
							</script>
							-->
			<%	} %>
	<div class="registerForm">
			<form method="post" action="router?userAction=updateUserData">
				<div class="field">
						<label>Change e-mail address</label>
						<label class="warning"><%=invalidEmail ? "E-Mail already in the system" : 
								invalidEmail ? "Invalid Email":"" %></label>
						<input type="email" name="newEmail" size="30" title="Mandatory"/>
				</div>
			
				<div class="field">
						<label>Password</label>
						<label class="warning"><%=wrongPassword ? "Wrong Password" : "" %></label>
						<input type="password" name="oldPassword" size="30" title="Your Old Password"/>
				</div>
				
				
				<div class="changePassword">
					<p>Change Password</p>
				</div>
				
				<div class="field">
						<label>New Password</label>
						<label class="warning"><%=wrongPassword ? "Wrong Password" : "" %></label>
						<input type="password" name="newPassword" size="30" title="Must be at least 5 characters."/>
				</div>
				
				<div class="field">
						<label>Repeat New Password</label>
						<label class="warning"><%=wrongPassword ? "Wrong Password" : "" %></label>
						<input type="password" name="confirmPassword" size="30" title="Repeat the password"/>
				</div>
		
				<div class="bottom">
					<input type="submit" value="Confirm!" />
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>

<%
	/*Clean the session control variables  */
	session.removeAttribute("invalidEmail");
	session.removeAttribute("wrongPassword");
	session.removeAttribute("wrongMatch");
	session.removeAttribute("updateDone");
%>