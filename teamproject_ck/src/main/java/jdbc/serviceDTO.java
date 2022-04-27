package jdbc;

public class serviceDTO {
	
	
	private String serid;
	private String sertitle;
	private String sercate;
	private String sercontent;
	private String seremail;
	private String serdate;
	
	
	public String getSerid() {
		return serid;
	}

	public void setSerid(String serid) {
		this.serid = serid;
	}

	
	public String getSertitle() {
		return sertitle;
	}

	public void setSertitle(String sertitle) {
		this.sertitle = sertitle;
	}

	public String getSercate() {
		return sercate;
	}

	public void setSercate(String sercate) {
		this.sercate = sercate;
	}

	public String getSercontent() {
		return sercontent;
	}

	public void setSercontent(String sercontent) {
		this.sercontent = sercontent;
	}

	public String getSeremail() {
		return seremail;
	}

	public void setSeremail(String seremail) {
		this.seremail = seremail;
	}

	public String getSerdate() {
		return serdate;
	}

	public void setSerdate(String serdate) {
		this.serdate = serdate;
	}

	public serviceDTO(String serid, String sertitle, String sercate, String sercontent, String seremail, String serdate) {
		super();

		this.serid = serid;
		this.sertitle = sertitle;
		this.sercate = sercate;
		this.sercontent = sercontent;
		this.seremail = seremail;
		this.serdate = serdate;
	}

}