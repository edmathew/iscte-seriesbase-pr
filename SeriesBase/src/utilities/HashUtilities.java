package utilities;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtilities {

	public static String getMD5Hash(String s) {
		byte[] hashMD5 = null;
		String hashText = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.reset();
			md.update(s.getBytes());
			hashMD5 = md.digest();
			BigInteger bigInt = new BigInteger(1,hashMD5);
			hashText = bigInt.toString(16);
			// Now we need to zero pad it if you actually want the full 32 chars.
			while(hashText.length() < 32 ){
				  hashText = "0"+hashText;
				}
		} catch (NoSuchAlgorithmException e) {
		}
		
		return hashText;
		
	
		
		

	}
}
