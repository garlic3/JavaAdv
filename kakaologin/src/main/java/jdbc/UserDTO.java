package jdbc;

public class UserDTO {
	private String uid; // 유저 아이다
	private String upw; // 유저 비밀번호
	private String uname; // 이름
	private String ugender; // 성별
	private String ubirth; // 생년월일
	private String uemail; // 이메일
	private String uaddr; // 주소
	private String uregitday; // 회원등록일
	public UserDTO() {
	}
	public UserDTO(String uid, String upw, String uname, String ugender, String ubirth, String uemail, String uaddr,
			String uregitday) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.ugender = ugender;
		this.ubirth = ubirth;
		this.uemail = uemail;
		this.uaddr = uaddr;
		this.uregitday = uregitday;
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
	public String getUemail() {
		return uemail;
	}
	public String getUaddr() {
		return uaddr;
	}
	public String getUregitday() {
		return uregitday;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	public void setUregitday(String uregitday) {
		this.uregitday = uregitday;
	}
}
