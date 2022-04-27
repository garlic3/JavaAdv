package util;

import java.io.*;

public class FileUtil { // 실제사진을 서버의 공간에 넣어주는 역할
	public static void saveImage(String root, String fname, byte[] data) throws IOException {
		root += "/images";
		
		File f = new File(root);
		if(!f.exists()) f.mkdir();
		
		f=new File(root + "/" + fname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close(); // eclipse의 브라우저에서는 주소값이 겹친다. 크롭에 맞추자.
	}
}
