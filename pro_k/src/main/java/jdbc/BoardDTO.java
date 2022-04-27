package jdbc;

public class BoardDTO {
	private String bid;
	private String btitle;
	private String bcontents;
	private String bts;
	private String blat;
	private String blon;
	
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public String getBts() {
		return bts;
	}
	public void setBts(String bts) {
		this.bts = bts;
	}
	public String getBlat() {
		return blat;
	}
	public void setBlat(String blat) {
		this.blat = blat;
	}
	public String getBlon() {
		return blon;
	}
	public void setBlon(String blon) {
		this.blon = blon;
	}
	
	public BoardDTO(String bid, String btitle, String bcontents, String bts) {
		this.bid = bid;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bts = bts;
	}
	public BoardDTO(String bid, String btitle, String bcontents, String bts, String blat, String blon) {
		this.bid = bid;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bts = bts;
		this.blat = blat;
		this.blon = blon;
	}
}
