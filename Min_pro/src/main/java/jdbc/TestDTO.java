// DB 요소가 조금 다를수 있음

package jdbc;

public class TestDTO {
	private double ulat,ulon;
	private String uid,upw,uname,ugender,ubirth;
	public double getUlat() {
		return ulat;
	}
	public double getUlon() {
		return ulon;
	}
	public String getUid() {
		return uid;
	}
	public String getUpw() {
		return upw;
	}
	public String getUname() {
		return uname;
	}
	public String getUgender() {
		return ugender;
	}
	public String getUbirth() {
		return ubirth;
	}
	public TestDTO(String uid, String upw, String uname, String ugender, String ubirth) {
	      super();
	      this.uid = uid;
	      this.upw = upw;
	      this.uname = uname;
	      this.ugender = ugender;
	      this.ubirth = ubirth;
	   }
}
