<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="styles/style.css" type="text/css"
	media="screen" />
<script type="text/javascript" async=""
	src="//s3.buysellads.com/ac/bsa.js"></script>
<!-- <link rel="stylesheet" href="styles/menu_style.css" type="text/css" /> -->
<!--        Script by hscripts.com          -->
<!--        copyright of HIOX INDIA         -->
<!-- more scripts @ http://www.hscripts.com -->

<script type="text/javascript">
	var rev = "fwd";
	function titlebar(val) {
	var msg = "Seriesbase - Your TV Series Database";
		var res = " ";
		var speed = 100;
		var pos = val;

		msg = "   |--- " + msg + " ---|";
		var le = msg.length;
		if (rev == "fwd") {
			if (pos < le) {
				pos = pos + 1;
				scroll = msg.substr(0, pos);
				document.title = scroll;
				timer = window.setTimeout("titlebar(" + pos + ")", speed);
			} else {
				rev = "bwd";
				timer = window.setTimeout("titlebar(" + pos + ")", speed);
			}
		} else {
			if (pos > 0) {
				pos = pos - 1;
				var ale = le - pos;
				scrol = msg.substr(ale, le);
				document.title = scrol;
				timer = window.setTimeout("titlebar(" + pos + ")", speed);
			} else {
				rev = "fwd";
				timer = window.setTimeout("titlebar(" + pos + ")", speed);
			}
		}
	}

	titlebar(0);
</script>
<!--   Script by hscripts.com     -->



</head>
<body>

	<jsp:include page="master.jsp" />



</body>
</html>