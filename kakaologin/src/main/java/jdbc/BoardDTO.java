package jdbc;

public class BoardDTO {
	private int bid; // 보드아이디
	private String buser; // 글쓴이
	private String btitle; // 보드 제목
	private String bcontents; // 보드 내용
	private String bts; // 보드 작성 시간
	public int getBid() {
		return bid;
	}
	public String getBuser() {
		return buser;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public String getBts() {
		return bts;
	}
	public BoardDTO(int bid, String buser, String btitle, String bcontents, String bts) {
		super();
		this.bid = bid;
		this.buser = buser;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bts = bts;
	}
}
