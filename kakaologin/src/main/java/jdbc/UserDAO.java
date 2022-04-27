package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
	public boolean insert(String uid, String upw, String uname, String ugender, String ubirth, String uemail, String uaddr) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upw);
				pstmt.setString(3, uname);
				pstmt.setString(4, ugender);
				pstmt.setString(5, ubirth);
				pstmt.setString(6, uemail);
				pstmt.setString(7, uaddr);
				pstmt.setString(8, LocalDate.now().toString());
			int result = pstmt.executeUpdate();
			return (result==1)? true : false;
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}	
	}
	
	public int login(String uid, String upw) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT uid, upw FROM user WHERE uid=?";
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setNString(1, uid);
				rs = pstmt.executeQuery();
				
				if(!rs.next()) { // 회원이 아닌 경우
					return 1;
				}
				if(!upw.equals(rs.getString("upw"))) return 2; // 암호를 틀린 경우
				
				return 0; // 정상인 경우
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
}
