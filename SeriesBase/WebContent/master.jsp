
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
	String location = request.getContextPath();
%>

<head>
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

<div class="header">
	<!-- @Ed - Falta o Logotipo -->
	<!-- Seriesbase ALPHA Version 2.0 Nuno<br /> -->

</div>

<%-- <div class="loginForm">
	<%
		if (!logged) {
	%>
	<form action="<%=location%>/loginControl?action=login" method="post">
		Username <input type="text" name="login" size="20" /><br /> Password
		<input type="password" name="password" size="20" /><br />
		<div class="loginFormLinks">
			<a href="">Forgot password</a><br /> <a
				href="<%=location%>/linkControl?link=register">New user?</a>
		</div>
		<input type="submit" value="Login" style="height: 25px; width: 80px;" />
	</form>
	<%
		} else {
	%>
	<div class="loginText">
		Welcome
		<%=session.getAttribute("loginname")%><br />
		<div style='text-align: right'>
			<a href="">Control Panel</a><br /> <a
				href="<%=location%>/loginControl?action=logout">Logout</a><br />
		</div>
	</div>

	<div class="loginImage">
		<%
			if (loginImage != null) {
		%>
		<img class="loginImageMin" src="<%=loginImage%>">
		<%
			}
		%>
	</div>
	<%
		}
	%>
</div>
 --%>

<div id="login">
	<div class="loginContent">
		<form action="#" method="post">
			<label for="log"><b>Username: </b> </label> <input class="field"
				type="text" name="log" id="log" value="" size="23" /> <label
				for="pwd"><b>Password:</b> </label> <input class="field"
				type="password" name="pwd" id="pwd" size="23" /> <input
				type="submit" name="submit" value="" class="button_login" /> <input
				type="hidden" name="redirect_to" value="" />
		</form>
		<div class="left">
			<label for="rememberme"><input name="rememberme"
				id="rememberme" class="rememberme" type="checkbox" checked="checked"
				value="forever" /> Remember me</label>
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
			<li>Hello Guest!</li>
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
	<div id="content">
		<p>The content of your page2!</p>
	</div>
	<div class="clearfix"></div>
</div>


<div class=footer>
	<td align="center">
		<table align="center" border="0" width="960">
			<tr>
				<td align="left" width="200"><a href="http://www.w3schools.com"><img
						border="0" src="/images/w3schoolscom_gray.gif" alt="W3Schools.com" />
				</a></td>
				<td align="right"
					style="word-spacing: 6px; font-size: 80%; padding-right: 10px;">
					<a href="/default.asp" target="_top">HOME</a> | <a href="#top"
					target="_top">TOP</a> | <a href='/css/css_dont.asp?output=print'
					target="_blank">PRINT</a> | <a href="/forum/default.asp"
					target="_blank">FORUM</a> | <a href="/about/default.asp"
					target="_top">ABOUT</a></td>
			</tr>

			<tr>
				<td valign="top" colspan="2" align="center" style="color: #404040;">
					<a href="" onclick="displayError();return false">Help
						W3Schools. Suggest corrections to this page.</a></td>
			</tr>
			<tr>

				<td valign="top" colspan="2" align="center"
					style="padding-top: 7px; color: #404040;">W3Schools is
					optimized for learning, testing, and training. Examples might be
					simplified to improve reading and basic understanding.<br />
					Tutorials, references, and examples are constantly reviewed to
					avoid errors, but we cannot warrant full correctness of all
					content.<br /> While using this site, you agree to have read and
					accepted our <a href="/about/about_copyright.asp">terms of use</a>
					and <a href="/about/about_privacy.asp">privacy policy</a>.<br /> <a
					href="/about/about_copyright.asp">Copyright 1999-2011</a> by
					Refsnes Data. All Rights Reserved.</td>

			</tr>
		</table> <br /></td>

</div>

