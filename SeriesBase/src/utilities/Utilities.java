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

}
