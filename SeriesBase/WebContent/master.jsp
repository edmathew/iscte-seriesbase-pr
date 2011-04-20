
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
			<li><a id="toggleLogin" href="#">Log In</a></li>
		</ul>
	</div>

	<!-- <div class="clearfix"></div> -->
	<div class="mainMenu">
		<ul id="menu">
			<li><a href="linkControl?link=home" target="_self" title="Home"
				class="current">Home</a>
			</li>
			<%
				if (logged) {
			%>
			<li><a href="linkControl?link=mySeries" target="_self"
				title="My Series">My Series</a>
			</li>
			<%
				}
			%>
			<li><a href="linkControl?link=series&action=getAll"
				target="_self" title="Series">Series</a>
			</li>
			<li><a href="linkControl?link=people" target="_self"
				title="People">People</a>
			</li>
			<li><a href="linkControl?link=about" target="_self"
				title="About">About</a>
			</li>
		</ul>
	</div>
	<div id="content">
		<p>The content of your page!</p>
	</div>
	<!-- <div class="clearfix"></div> -->