package jdbc;

public class MemoDTO {

	
	private String mid;
	private String memo;
	private String uid;
	private String mdone;
	private String mdate;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getMdone() {
		return mdone;
	}
	public void setMdone(String mdone) {
		this.mdone = mdone;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	
	
	public MemoDTO() {
	}
	public MemoDTO(String mid, String memo, String uid, String mdone, String mdate) {
		super();
		this.mid = mid;
		this.memo = memo;
		this.uid = uid;
		this.mdone = mdone;
		this.mdate = mdate;
	}
	
	

}
