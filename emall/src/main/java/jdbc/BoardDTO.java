package jdbc;

public class BoardDTO {
	private String bid; 		//상품 아이디 
	private String bname;	 	//상품 이름
	private String btitle;			//상품 가격
	private String bcon; 		//상품 설명
	private String bts;		//상품 제조사
	
	
	public String getBid() {
		return bid;
	}
	public String getBname() {
		return bname;
	}
	public String getBtitle() {
		return btitle;
	}
	public String getBcon() {
		return bcon;
	}
	public String getBts() {
		return bts;
	}
	public BoardDTO(String bid, String bname, String btitle, String bcon, String bts) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.btitle = btitle;
		this.bcon = bcon;
		this.bts = bts;
	}
	
}
