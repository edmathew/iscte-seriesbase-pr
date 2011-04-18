
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
	String location = request.getContextPath();
%>

<div class="header">
	<!-- @Ed - Falta o Logotipo -->
	Seriesbase ALPHA Version 2.0 Nuno<br />
	
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

<%-- <div class="mainMenu">
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
 --%>
 <div class="mainMenu">
 <ul id="menu">
   <li><a href="linkControl?link=home" target="_self" title="Home" class="current">Home</a></li>
   <%if (logged) {	%>
   <li><a href="linkControl?link=mySeries" target="_self" title="My Series">My Series</a></li>
   <% } %>
   <li><a href="linkControl?link=series" target="_self" title="Series">Series</a></li>
   <li><a href="linkControl?link=people" target="_self" title="People">People</a></li>
   <li><a href="linkControl?link=about" target="_self" title="About">About</a></li>
</ul>
</div>
 <%-- <div id="cnn_hdr-nav">
	<ul id="intl-menu">
		<li class="no-border"><a id="nav-home"
			class="nav-media no-border nav-on" href="/linkControl?action=home" title="Homepage">Home</a>
		</li>
		<%
			if (logged) {
		%>
		<li class="no-border"><a id="nav-mySeries"
			class="nav-media no-border" href="/linkControl?action=mySeries"
			title="My personal space where i can control my series">My Series</a>
		</li>
		<%
			}
		%>
		<li><a id="nav-series" href="/linkControl?action=series" title="Global Series Database">Series</a></li>
		<li><a id="nav-people" href="/linkControl?action=people" title="People information">People</a>
		</li>
		<li><a id="nav-about" href="/linkControl?action=about" title="More about us">About</a>
		</li>
	</ul>
</div>
 --%>