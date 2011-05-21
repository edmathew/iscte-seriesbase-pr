package utilities;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utilities {

	/**
	 * 
	 * @param date
	 * @param pattern
	 * @return
	 * @throws ParseException
	 */
	public static Date parseDate(String date, String pattern)
			throws ParseException {
		if (date == null)
			throw new IllegalArgumentException();

		DateFormat format = new SimpleDateFormat(pattern);
		Date d = format.parse(date);
		return d;
	}

	public static boolean validEmail(String email){
		if(email == null || email.length() == 0)
			return false;
		
		int atPos = email.indexOf((int)'@');
		int dotPos = email.lastIndexOf((int)'.');
		
		if(atPos < 1 || dotPos < atPos+2 || dotPos +2 >= email.length())
			return false;
		
		
		return true;
	}

}
