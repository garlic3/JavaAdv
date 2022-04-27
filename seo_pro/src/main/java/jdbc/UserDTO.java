package jdbc;

public class UserDTO {


	private String uid;
	private String upw;
	private String uname;
	private String ugender;
	private String ubirth;
	private String ulat;
	private String ulon;
	private String usingup;
	private String ukakako;
	private String ulike;
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public String getUbirth() {
		return ubirth;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	public String getUlat() {
		return ulat;
	}
	public void setUlat(String ulat) {
		this.ulat = ulat;
	}
	public String getUlon() {
		return ulon;
	}
	public void setUlon(String ulon) {
		this.ulon = ulon;
	}
	public String getUsingup() {
		return usingup;
	}
	public void setUsingup(String usingup) {
		this.usingup = usingup;
	}
	public String getUkakako() {
		return ukakako;
	}
	public void setUkakako(String ukakako) {
		this.ukakako = ukakako;
	}
	public String getUlike() {
		return ulike;
	}
	public void setUlike(String ulike) {
		this.ulike = ulike;
	}
	
	public UserDTO(String uid, String upw, String uname, String ugender, String ubirth, String ulat, String ulon,
			String usingup, String ukakako, String ulike) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.ugender = ugender;
		this.ubirth = ubirth;
		this.ulat = ulat;
		this.ulon = ulon;
		this.usingup = usingup;
		this.ukakako = ukakako;
		this.ulike = ulike;
	}
	
	public UserDTO() {
		
	}
	
	
	
	
	

}
