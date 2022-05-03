package jdbc;

public class LikeDTO {

	private String lid;
	private String uid;
	private String bid;
	private String ulike;
	private String uwatch;
	
	
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getUlike() {
		return ulike;
	}
	public void setUlike(String ulike) {
		this.ulike = ulike;
	}
	public String getUwatch() {
		return uwatch;
	}
	public void setUwatch(String uwatch) {
		this.uwatch = uwatch;
	}
	
	
	public LikeDTO(String lid, String uid, String bid, String ulike, String uwatch) {
		super();
		this.lid = lid;
		this.uid = uid;
		this.bid = bid;
		this.ulike = ulike;
		this.uwatch = uwatch;
	}
	public LikeDTO() {

	}

	
	
	
	
}
