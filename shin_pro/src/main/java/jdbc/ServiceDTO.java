package jdbc;

public class ServiceDTO {
	
	private String serid;
	private String seruid;
	private String sertitle;
	private String sercate;
	private String sercontent;
	private String seremail;
	private String serdate;
	private String serstatus;
	
	public String getSerid() {
		return serid;
	}
	public void setSerid(String serid) {
		this.serid = serid;
	}
	public String getSeruid() {
		return seruid;
	}
	public void setSeruid(String seruid) {
		this.seruid = seruid;
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
	public String getSerstatus() {
		return serstatus;
	}
	public void setSerstatus(String serstatus) {
		this.serstatus = serstatus;
	}
	
	
	public ServiceDTO(String serid, String seruid, String sertitle, String sercate, String sercontent, String seremail,
			String serdate, String serstatus) {
		super();
		this.serid = serid;
		this.seruid = seruid;
		this.sertitle = sertitle;
		this.sercate = sercate;
		this.sercontent = sercontent;
		this.seremail = seremail;
		this.serdate = serdate;
		this.serstatus = serstatus;
	}
	
	public ServiceDTO() {
		
	}

}

