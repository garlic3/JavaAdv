package jdbc;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ServiceDAO {
	
	public ArrayList<ServiceDTO> getList() 
	throws NamingException, SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = ConnectionPool.get();
		
		String sql = "SELECT * FROM service";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<ServiceDTO> services = new ArrayList<ServiceDTO>();
	
		while(rs.next()) {
			services.add(new ServiceDTO(rs.getString("serid"),
									rs.getString("seruid"),
									rs.getString("sertitle"),
									rs.getString("sercate"),
									rs.getString("sercontent"),
									rs.getString("seremail"),
									rs.getString("serdate"),
									rs.getString("serstatus")));
								
		}
		
		return services;
	}
	
	public boolean Insert(String seruid, String sertitle, String sercate, String sercontent, String seremail, String serstatus)
			throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			pstmt.setString(3, uname);
			pstmt.setString(4, ugender);
			pstmt.setString(5, ubirth);
	
			int result = pstmt.executeUpdate();

			return (result == 1 ? true : false);

		} finally {
			if (pstmt != null)
				pstmt.close();

			if (conn != null)
				conn.close();

		}
	}

	public int insert(String seruid, String sertitle, String sercate, String sercontent, String seremail, String serstatus)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO service (?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, seruid);
				pstmt.setString(2, sertitle);
				pstmt.setString(3, sercate);
				pstmt.setString(4, sercontent);
				pstmt.setString(5, seremail);
				pstmt.setString(6, serstatus);
	
			int result = pstmt.executeUpdate();
			
			return result;			
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
}