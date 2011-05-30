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
<div class="controlPanel">
			<form method="post" action="router?userAction=updateUserData">
				<div class ="email">
				<label> Change e-mail address: </label> <input type="text" size="20"
					name="newEmail"
					value="<%=invalidEmail ? (String)session.getAttribute("invalidEmail") : "" %>" />
				<%	if(invalidEmail){ %>
				<p>Email already in System</p>
				<%	} %>
				</div>
				<div class="changePassword">
				<p>Change Password</p>
				</div>
				<div class="pass">
				<label>Old Password</label> <input type="password" size="20"
					name="oldPassword" />
				<%	if(wrongPassword){%>
				<p>Wrong Password</p>
				<%	} %>
				<p></p>
				<p><label>New Password</label> <input type="password" size="20"
					name="newPassword" /> </p> <p><label>Confirm New Password</label> <input
					type="password" size="20" name="confirmPassword" /> </p> <br />
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