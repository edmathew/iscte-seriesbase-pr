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
	if (string == null || string.trim() == "")
		return false;

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

