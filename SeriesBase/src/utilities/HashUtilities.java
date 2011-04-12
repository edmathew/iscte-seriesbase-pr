package utilities;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtilities {

	public static String getMD5Hash(String s) {
		byte[] hashMD5 = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(s.getBytes());
			hashMD5 = md.digest();
		} catch (NoSuchAlgorithmException e) {
		}
		return hashMD5.toString();
	}
}
