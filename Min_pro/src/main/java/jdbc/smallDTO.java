package jdbc;

public class smallDTO {
	private int num;
	private double lan,lon;
	String content;
	  
	public String getContent() { return content; }
	 
	public int getNum() {
		return num;
	}
	public double getLan() {
		return lan;
	}
	public double getLon() {
		return lon;
	}

	public smallDTO(int num, double lan, double lon, String content) {
	      super();
	      this.num = num;
	      this.lan = lan;
	      this.lon = lon;
		  this.content = content;
	   }
}
