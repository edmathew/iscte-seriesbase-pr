<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="images/icon_1_test.ico" rel="icon" />
<link href="images/icon_1_test.ico" rel="shortcut icon" />
<script type="text/javascript" async=""
	src="//s3.buysellads.com/ac/bsa.js"></script>
<script type="text/javascript">
	var rev = "fwd";
	function titlebar(val, directory) {
	var msg = directory + "SeriesBase   -   Your TV Series Database Where You Can Find It All";
		var res = " ";
		var speed = 100;
		var pos = val;

		msg = "|------ " + msg + " ------|";
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

</head>
<body>

</body>
</html>