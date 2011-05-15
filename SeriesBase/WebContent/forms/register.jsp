<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%
	boolean duplicatedUsername = session.getAttribute("duplicatedUsername")!= null;
	boolean duplicatedEmail = session.getAttribute("duplicatedEmail") != null;
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
		
		<title>Register</title>
		
		<script type="text/javascript" src="../scripts/validationScripts.js"></script>
		<script type="text/javascript">
			function validateForm(){
				var errorMessage = "";
				var name = document.forms["registerForm"]["username"].value;
				if(!validString(name))
					errorMessage += "\tEmpty or Invalid Username\n";
				
				var email = document.forms["registerForm"]["email"].value;
				if(!validEmail(email))
					errorMessage += "\tEmpty or Invalid Email\n";
				
				var password = document.forms["registerForm"]["password"].value;
				if(!validString(password))
					errorMessage += "\tPassword Field Required\n";
				
				var repeatPassword = document.forms["registerForm"]["repeatPassword"].value;
				if(!validString(repeatPassword))
					errorMessage += "\tRepeat Password Field Required\n";
				else if(repeatPassword.toString() != password.toString()){
					errorMessage += "\tPasswords doesn't match\n";				
					alert(password+" - "+repeatPassword);
				}
				
				var birthDate = document.forms["registerForm"]["birth"].value;
				if(!validDate(birthDate))
					errorMessage += "\tInvalid Date";				
									
				if(errorMessage != ""){
					alert("Errors:\n"+errorMessage);
					return false;
				}
				
				return true;
			}
		</script>
		<jsp:include page="../headerLinks.jsp"/>
	</head>
		
	<body>
		<%-- <%@include file="../index.jsp" %> --%>
		<jsp:include page="../menu.jsp"/>
		
		<div class="registerForm">
			<p class="title">Register at Seriesbase</p>
			<form name="registerForm" action="../loginControl?action=register" method="post" onsubmit="return validateForm()">					
				<table>
					<tr>
						<td class="label">Username</td>
						<td class="field"><input type="text" name="username" size="30" value="<%if(postBack)%><%=username%>" /></td>
						<td class="error"><%if(duplicatedUsername){%>Duplicated Username<%} %></td>
					</tr>
					<tr>
						<td class="label">E-Mail</td>
						<td class="field"><input type="email" name="email" size="30" value="<%if(postBack)%><%=email%>" placeholder="someone@mail.com"/></td>
						<td class="error"><%if(duplicatedEmail){%>Duplicated Email<%} %></td>
					</tr>
					<tr>
						<td class="label">Password</td>
						<td class="field"><input type="password" name="password" size="30"/></td>
					</tr>
					<tr>
						<td class="label">Repeat Password</td>
						<td class="field"><input type="password" name="repeatPassword" size="30"/></td>
					</tr>
					<tr>
						<td class="label">Birth Date (yyyy-mm-dd)</td>
						<td class="field"><input type="date" name="birth" size="30" placeholder="yyyy-mm-dd" value="<%if(postBack)%><%=birth%>"/></td>
					</tr>
					<tr>
						<td class="label">Profile Image URL</td>
						<td class="field"><input type="url" name="imageURL" size="30" value="<%if(postBack)%><%=imageURL%>")/></td>
					</tr>
				</table>
					<p class="submitButton"><input type="submit" value="Register" 
					style="height: 25px; width: 100px;"/></p>
			</form>
		</div>
		<jsp:include page="../footer.jsp" />
	</body>
</html>