package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class ProductDAO {
	public ArrayList<ProductDTO> getAllProducts(){
		while(rs.next()) {
			listOfProducts.add(new ProductDTO(user.getUid(), // beans
										
			));
		}
		return listOfProducts;
	}
	
	public ArrayList<ProductDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM product";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<ProductDTO> products = new ArrayList<ProductDTO>();
			
			while(rs.next()) {
				products.add(new ProductDTO(rs.getNString("pid"), // beans
											rs.getNString("pname"),
											rs.getNString("pprice"),
											rs.getNString("pdesc"),
											rs.getNString("pmanu"),
											rs.getNString("pcate"),
											rs.getNString("pcondi"),
											rs.getNString("pimage")
				));
			}
			return products;
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public ProductDTO getDetail(String pid) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM product WHERE pid=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pid);
			rs = pstmt.executeQuery();
						
			rs.next();
			
			String id = rs.getNString(1);
			String pname = rs.getNString(2);
			String pprice = rs.getNString(3);
			String pdesc = rs.getNString(4);
			String pmanu = rs.getNString(5);
			String pcate = rs.getNString(6);
			String pcondi = rs.getNString(7);
			String pimage = rs.getNString(8);
			
			ProductDTO product = new ProductDTO(id, pname, pprice, pdesc, pmanu, pcate, pcondi, pimage);
			
			return product;
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean insert(String pid, String pname, String pprice, String pdesc, String pmanu, String pcate, String pcondi, String pimage) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pid);
				pstmt.setString(2, pname);
				pstmt.setString(3, pprice);
				pstmt.setString(4, pdesc);
				pstmt.setString(5, pmanu);
				pstmt.setString(6, pcate);
				pstmt.setString(7, pcondi);
				pstmt.setString(8, pimage);
			int result = pstmt.executeUpdate();
			return (result==1)? true : false;
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
	}
}
