package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class serviceDAO {
	
	public ArrayList<serviceDTO> getList()
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM servicecenter";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<serviceDTO> servicecenter = new ArrayList<serviceDTO>();
			
			while(rs.next()) {
				servicecenter.add(new serviceDTO(rs.getString("serid"),
											rs.getString("sertitle"),
											rs.getString("sercate"),
											rs.getString("sercontent"),
											rs.getString("seremail"),
											rs.getString("serdate")));
			}
			return servicecenter;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		
	}
	
	
	
	
	public serviceDTO getDetail(String serid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM servicecenter WHERE serid = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, serid);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			serid = rs.getString(1);
			String sertitle = rs.getString(2);
			String sercate = rs.getString(3);
			String sercontent = rs.getString(4);
			String seremail = rs.getString(4);
			String serdate = rs.getString(5);

			
			serviceDTO service = new serviceDTO(serid, sertitle, sercate, sercontent, seremail, serdate);
			
			return service;
			
	} finally {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	}
	
	
	
	
	public boolean insert(String sertitle, String sercate, String sercontent, String seremail)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO servicecenter (sertitle, sercate, sercontent, seremail) VALUES (?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sertitle);
				pstmt.setString(2, sercate);
				pstmt.setString(3, sercontent);
				pstmt.setString(4, seremail);
			int result = pstmt.executeUpdate();
			
			return (result==1) ? true : false;			
			
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
}