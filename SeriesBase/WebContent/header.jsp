<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
	String location = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- The main style sheet -->
<link rel="stylesheet" href="styles/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="styles/styleLogin.css" type="text/css"
	media="screen" />
<!-- START Fx.Slide -->
<!-- The CSS -->
<link rel="stylesheet" href="styles/fx.slide.css" type="text/css"
	media="screen" />
<!-- Mootools - the core -->
<script type="text/javascript" src="scripts/mootools-1.2-core-yc.js"></script>
<!--Toggle effect (show/hide login form) -->
<script type="text/javascript" src="scripts/mootools-1.2-more.js"></script>
<script type="text/javascript" src="scripts/fx.slide.js"></script>
<!-- END Fx.Slide -->
</head>

<body>
	<div id="login">
		<div class="loginContent">
			<form action="<%=location%>/loginControl?action=login" method="post">
				<label for="log"><b>Username: </b> </label> <input class="field"
					type="text" name="log" id="log" value="" size="23" /> <label
					for="pwd"><b>Password:</b> </label> <input class="field"
					type="password" name="pwd" id="pwd" size="23" /> <input
					type="submit" name="submit" value="" class="button_login" /> <input
					type="hidden" name="redirect_to" value="" />
			</form>
			<div class="left">
				<label for="rememberme"><input name="rememberme"
					id="rememberme" class="rememberme" type="checkbox"
					checked="checked" value="forever" /> Remember me</label>
			</div>
			<div class="right">
				Not a member? <a href="#">Register</a> | <a href="#">Lost your
					password?</a>
			</div>
		</div>
		<div class="loginClose">
			<a href="#" id="closeLogin">Close Panel</a>
		</div>
	</div>

	<div id="container">
		<div id="top">
			<ul class="login">
				<li class="left">&nbsp;</li>
				<%
				if(logged){
				%>
				<li>Hello <%=session.getAttribute("loginname")%>!</li>
				<%
				}else{
				%>
				<li>Hello Guest!</li>
				<%
				}
				%>

				<li>|</li>
				<li><a id="toggleLogin" href="#">Log In</a>
				</li>
			</ul>
		</div>

		<!-- <div class="clearfix"></div> -->
		<div class="mainMenu">
			<ul id="menu">
				<li><a href="linkControl?link=home" target="_self" title="Home"
					class="current">Home</a></li>
				<%
					if (logged) {
				%>
				<li><a href="linkControl?link=mySeries" target="_self"
					title="My Series">My Series</a></li>
				<%
					}
				%>
				<li><a href="linkControl?link=series&action=getAll"
					target="_self" title="Series">Series</a></li>
				<li><a href="linkControl?link=people" target="_self"
					title="People">People</a></li>
				<li><a href="linkControl?link=about" target="_self"
					title="About">About</a></li>
			</ul>
		</div>
	</div>
</body>
</html>