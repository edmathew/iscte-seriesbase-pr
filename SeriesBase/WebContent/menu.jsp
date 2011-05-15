
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
	String location = request.getContextPath();
	String currentMenu = (String) session.getAttribute("menu");
%>
<div id="rodTop"></div>
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
				id="rememberme" class="rememberme" type="checkbox" checked="checked"
				value="forever" /> Remember me</label>
		</div>
		<div class="right">
			Not a member? <a href="linkControl?link=register">Register</a> | <a
				href="#">Lost your password?</a>
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
				if (logged) {
			%>
			<li>Hello <%=session.getAttribute("loginname")%>!</li>
			<li>|</li>
			<li><a href="linkControl?link=logout">Log Out</a>
			</li>
			<%
				} else {
			%>
			<li>Hello Guest!</li>
			<li>|</li>
			<li><a id="toggleLogin" href="#">Log In</a>
			</li>
			<%
				}
			%>


		</ul>
	</div>

	<!-- <div class="clearfix"></div> -->
	<div class="mainMenu">
		<ul id="menu">
			<%
				if (currentMenu.equals("home")) {
			%>
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
			<%
				}
			%>

			<%
				if (currentMenu.equals("mySeries")) {
			%>
			<li><a href="linkControl?link=home" target="_self" title="Home">Home</a>
			</li>
			<%
				if (logged) {
			%>
			<li><a href="linkControl?link=mySeries" target="_self"
				title="My Series" class="current">My Series</a></li>
			<%
				}
			%>
			<li><a href="linkControl?link=series&action=getAll"
				target="_self" title="Series">Series</a></li>
			<li><a href="linkControl?link=people" target="_self"
				title="People">People</a></li>
			<li><a href="linkControl?link=about" target="_self"
				title="About">About</a></li>
			<%
				}
			%>

			<%
				if (currentMenu.equals("series")) {
			%>
			<li><a href="linkControl?link=home" target="_self" title="Home">Home</a>
			</li>
			<%
				if (logged) {
			%>
			<li><a href="linkControl?link=mySeries" target="_self"
				title="My Series">My Series</a></li>
			<%
				}
			%>
			<li><a href="linkControl?link=series&action=getAll"
				target="_self" title="Series" class="current">Series</a></li>
			<li><a href="linkControl?link=people" target="_self"
				title="People">People</a></li>
			<li><a href="linkControl?link=about" target="_self"
				title="About">About</a></li>
			<%
				}
			%>

			<%
				if (currentMenu.equals("people")) {
			%>
			<li><a href="linkControl?link=home" target="_self" title="Home">Home</a>
			</li>
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
				title="People" class="current">People</a></li>
			<li><a href="linkControl?link=about" target="_self"
				title="About">About</a></li>
			<%
				}
			%>

			<%
				if (currentMenu.equals("about")) {
			%>
			<li><a href="linkControl?link=home" target="_self" title="Home">Home</a>
			</li>
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
				title="About" class="current">About</a></li>
			<%
				}
			%>

		</ul>
	</div>
</div>
