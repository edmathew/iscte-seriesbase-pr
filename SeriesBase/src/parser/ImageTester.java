package parser;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

public class ImageTester {

	public static void save(BufferedImage image, String ext, String fileName) {
		File file = new File("WebContent\\" + fileName);
		try {
			ImageIO.write(image, ext, file); // ignore returned boolean
		} catch (IOException e) {
			System.out.println("Write error for " + file.getPath() + ": "
					+ e.getMessage());
		}
	}

	public static void main(String[] args) {
		BufferedImage image = null;
		try {
			// Read from a URL
			URL url = new URL(
					"http://thetvdb.com/banners/posters/80348-6.jpg");
			image = ImageIO.read(url);
			save(image, "jpg", "savingAnImage.jpg");
		} catch (IOException e) {
			System.out.println("I didn't read that crap");
		}
		
		System.out.println("DONE");

	}
}
