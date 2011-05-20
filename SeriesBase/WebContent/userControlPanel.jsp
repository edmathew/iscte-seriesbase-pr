<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		<jsp:include page="headerLinks.jsp"/>
	</head>
	<body>
	
		<div class="container">
			<jsp:include page="menu.jsp" />
				<div class="controlPanel">
					<h1>Control Panel</h1>
					
					<%	if(updateDone){ %>
							<p>Changes saved</p>
							<!--  <script type="text/javascript">
								alert("Changes saved!");
							</script>
							-->
					<%	} %>
					
					<form method="post" action="router?action=updateUserData">
						<label>Change e-mail address: </label>
						<input type="text" size="20" name="newEmail" 
							value="<%=invalidEmail ? (String)session.getAttribute("invalidEmail") : "" %>" />
						<%	if(invalidEmail){ %>
								<p>Email already in System</p>
						<%	} %>
						
						
						<p>Change Password</p>
						<label>Old Password</label>
						<input type="password" size="20" name="oldPassword" />
						<%	if(wrongPassword){%>
								<p>Wrong Password</p>
						<%	} %>
						
						<label>New Password</label>
						<input type="password" size="20" name="newPassword" />
						
						<label>Confirm New Password</label>
						<input type="password" size="20" name="confirmPassword"/>
						
						<br/>
						<input type="submit" value="Confirm!"/>
					</form>
				</div>
				
		</div>
		<jsp:include page="footer.jsp" />
	
	</body>
</html>

<%
	/*Clean the control session variables  */
	session.removeAttribute("invalidEmail");
	session.removeAttribute("wrongPassword");
	session.removeAttribute("wrongMatch");
	session.removeAttribute("updateDone");
%>