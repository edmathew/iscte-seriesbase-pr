/***************************************************
 * Form Validation Scripts.
 * 
 * @author Edgar Mateus
 * @version April 2011
 **************************************************/

/**
 * Checks if string is a valid string.
 * 
 * @param string
 *            string to evaluate.
 */
function validString(string) {
	if (string == null || string == ""){
		alert("Invalid String");
		return false;
	}

	return true;
}

/**
 * Checks if email is a valid string with a e-mail format.
 * 
 * @param email
 *            string to evaluate.
 */
function validEmail(email) {
	if (!validString(email))
		return false;

	var atpos = email.indexOf("@");
	var dotpos = email.lastIndexOf(".");
	if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length)
		return false;

	return true;
}


function validDate(date){
	var regExp = /(\d{4})-(\d{2})-(\d{2})/;
	var currentDate = new Date();
	if(!date.match(regExp))
		return false;
	
	var m = date.match(regExp);
	if(m[1] > currentDate.getFullYear())
		return false;
	
	if(m[2] < 1 || m[2] > 12)
		return false;
	
	if(m[3] < 1 || m[3] > 31)
		return false;
		
	if(m[2] == 2 && m[3]> 29)
		return false;
		
	if((m[2] == 4 || m[2] == 6 || m[2] == 9 || m[2] == 11)&& m[3] > 30)
		return false;
	
	return true;
}

