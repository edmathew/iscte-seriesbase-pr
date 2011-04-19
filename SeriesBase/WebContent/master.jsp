
<%
	boolean logged = session.getAttribute("loginname") != null;
	boolean bruteForce = session.getAttribute("bruteForceLogin") != null;
	String loginImage = (String) session.getAttribute("loginImageURL");
	String location = request.getContextPath();
%>

<div class="header">
	<!-- @Ed - Falta o Logotipo -->
	<!-- Seriesbase ALPHA Version 2.0 Nuno<br /> -->

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
		<li><a href="linkControl?link=series" target="_self"
			title="Series">Series</a>
		</li>
		<li><a href="linkControl?link=people" target="_self"
			title="People">People</a>
		</li>
		<li><a href="linkControl?link=about" target="_self" title="About">About</a>
		</li>
	</ul>
</div>
<div class=footer>
	<td align="center">
		<table align="center" border="0" width="960">
			<tr>
				<td align="left" width="200"><a href="http://www.w3schools.com"><img
						border="0" src="/images/w3schoolscom_gray.gif" alt="W3Schools.com" />
				</a>
				</td>
				<td align="right"
					style="word-spacing: 6px; font-size: 80%; padding-right: 10px;">
					<a href="/default.asp" target="_top">HOME</a> | <a href="#top"
					target="_top">TOP</a> | <a href='/css/css_dont.asp?output=print'
					target="_blank">PRINT</a> | <a href="/forum/default.asp"
					target="_blank">FORUM</a> | <a href="/about/default.asp"
					target="_top">ABOUT</a>
				</td>
			</tr>

			<tr>
				<td valign="top" colspan="2" align="center" style="color: #404040;">
					<a href="" onclick="displayError();return false">Help
						W3Schools. Suggest corrections to this page.</a>
				</td>
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
		</table> <br />
	</td>

</div>

