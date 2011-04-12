<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
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
					errorMessage += "Invalid Username\n";
				
				var email = document.forms["registerForm"]["email"].value;
				if(!validEmail(email))
					errorMessage += "Invalid Email\n";
				
				var password = document.forms["registerForm"]["password"].value;
				if(!validString(password))
					errorMessage += "Password Field Required\n";
				
				var repeatPassword = document.forms["registerForm"]["repeatPassword"].value;
				if(!validString(password))
					errorMessage += "Repeat Password Field Required\n";
				else if(password != repeatPassword)
					errorMessage += "Passwords doesn't match\n";
				
				var birthDate = document.forms["registerForm"]["birth"].value;
				
					
				
				if(errorMessage != ""){
					alert("Errors:\n"+errorMessage);
					return false;
				}
				return true;
			}
		</script>
	</head>
		
	<body>
		<%@include file="../master.jsp" %>
		
		<div class="registerForm">
			<p class="title">Register at Seriesbase</p>
			<form name="registerForm" action="../registerControl" method="post" onsubmit="return validateForm()">					
				<table>
					<tr>
						<td class="label">Username</td>
						<td class="field"><input type="text" name="username" size="30"/></td>
					</tr>
					<tr>
						<td class="label">E-Mail</td>
						<td class="field"><input type="email" name="email" size="30" placeholder="someone@mail.com"/></td>
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
						<td class="field"><input type="date" name="birth" size="30" placeholder="yyyy-mm-dd"/></td>
					</tr>
					<tr>
						<td class="label">Profile Image URL</td>
						<td class="field"><input type="url" name="birth" size="30"/></td>
					</tr>
				</table>
					<p class="submitButton"><input type="submit" value="Register" 
					style="height: 25px; width: 100px;"/></p>
			</form>
		</div>
	</body>
</html>