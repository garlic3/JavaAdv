package jdbc;

public class ProductDTO {
	private String pid; 		//상품 아이디 
	private String pname;	 	//상품 이름
	private String pprice;			//상품 가격
	private String pdsec; 		//상품 설명
	private String pmenu;		//상품 제조사
	private String pcate;		//상품 분류 
	private String pcondi;		//신상품 중고품 재고품 
	private String pimage;		//신상품 중고품 재고품 

	
	public String getPid() {
		return pid;
	}
	public String getPname() {
		return pname;
	}
	public String getPprice() {
		return pprice;
	}
	public String getPdsec() {
		return pdsec;
	}
	public String getPmenu() {
		return pmenu;
	}
	public String getPcate() {
		return pcate;
	}
	public String getPcondi() {
		return pcondi;
	}
	public String getPimage() {
		return pimage;
	}
	public ProductDTO(String pid, String pname, String pprice, String pdsec, String pmenu, String pcate,
			String pcondi, String pimage) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pdsec = pdsec;
		this.pmenu = pmenu;
		this.pcate = pcate;
		this.pcondi = pcondi;
		this.pimage = pimage;

	}
	
	
	
	
}
