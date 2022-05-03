package jdbc;

public class ReplyDTO {

	
	private String bid;
	private String uid;
	private String content;
	private String ts;
	
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTs() {
		return ts;
	}
	public void setTs(String ts) {
		this.ts = ts;
	}
	
	
	
	
	public ReplyDTO() {
	}
	public ReplyDTO(String bid, String uid, String content, String ts) {
		super();
		this.bid = bid;
		this.uid = uid;
		this.content = content;
		this.ts = ts;
	}
	
	
}
