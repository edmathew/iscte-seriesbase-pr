/***************************************************
 * Form Sliding Title Scripts.
 * 
 * @author Nuno Dias
 * @version April 2011
 **************************************************/

//var rev = "fwd";
//function titlebar(dir) {
//if(dir == null){
//var msg = "SeriesBase   -   Your TV Series Database Where You Can Find It All";
//}
//else{
//var msg = dir + " - " + "SeriesBase   -   Your TV Series Database Where You Can Find It All";
//}
//var res = " ";
//var speed = 100;
//var pos = 0;

//msg = "|------ " + msg + " ------|";
//var le = msg.length;
//if (rev == "fwd") {
//if (pos < le) {
//pos = pos + 1;
//scroll = msg.substr(0, pos);
//document.title = scroll;
//timer = window.setTimeout("titlebar(" + pos + ")", speed);
//} else {
//rev = "bwd";
//timer = window.setTimeout("titlebar(" + pos + ")", speed);
//}
//} else {
//if (pos > 0) {
//pos = pos - 1;
//var ale = le - pos;
//scrol = msg.substr(ale, le);
//document.title = scrol;
//timer = window.setTimeout("titlebar(" + pos + ")", speed);
//} else {
//rev = "fwd";
//timer = window.setTimeout("titlebar(" + pos + ")", speed);
//}
//}
//}

//titlebar(null);

var msg = "SeriesBase   -   Your TV Series Database Where You Can Find It All";
var pos = 0;
var spacer = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
var time_length = 350;
function ScrollTitle()
{
	document.title = msg.substring(pos, msg.length) + '&nbsp' + '&nbsp' + '&nbsp' + '&nbsp' + '&nbsp' + '&nbsp' + msg.substring(0, pos);
	pos++;
	if (pos > msg.length) pos=0;
	window.setTimeout("ScrollTitle()",time_length);
}
ScrollTitle();