
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
	String location = request.getContextPath();
%>

<div class="header">
	<!-- @Ed - Falta o Logotipo -->
	Seriesbase ALPHA Version<br />
</div>

<div class="loginForm">
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

<div class="mainMenu">
	<hr width="500px" align="left" />
	<ul>
		<li><a href="?action=home">Home</a></li>
		<%
			if (logged) {
		%>
		<li><a href="">My Account</a></li>
		<%
			}
		%>
		<li><a href="">Series</a></li>
		<li><a href="">People</a></li>
		<li><a href="">About</a></li>
	</ul>
	<br />
	<hr width="500px" align="left" />

</div>
<div id="cnn_hdr-nav">
	<ul id="intl-menu">
		<li class="no-border"><a id="nav-home"
			class="nav-media no-border nav-on" href="/" title="Homepage">   Home</a>
		</li>
		<%
			if (logged) {
		%>
		<li class="no-border"><a id="nav-mySeries"
			class="nav-media no-border" href="/video/"
			title="My personal space where i can control my series">My Series</a>
		</li>
		<%
			}
		%>
		<li><a id="nav-series" href="/WORLD/"
			title="Global Series Database">Series</a></li>
		<li><a id="nav-people" href="/US/" title="People information">People</a>
		</li>
		<li><a id="nav-about" href="/AFRICA/" title="More about us">About</a>
		</li>
	</ul>
</div>
