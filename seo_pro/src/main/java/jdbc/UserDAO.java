package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ConnectionPool;

public class UserDAO {
	
	// 나의페이지 - DB에서 회원정보를 불러오는 매서드 - 정관, 민성
	public UserDTO getDetail(String uid) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user WHERE uid=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			rs.next();
			uid = rs.getString(1);
			String upw = rs.getString(2); //upw(비밀번호)
			String uname = rs.getString(3); //uname(이름)
			String ugender = rs.getString(4); //ugender(성별)
			String ubirth = rs.getString(5); //ubirth(생년월일)
			String ulat = rs.getString(6);
			String ulon = rs.getString(7);
			String usignup = rs.getString(8);
			String ukakao = rs.getString(9);
			String ulike = rs.getString(10);
			
			UserDTO userInfo = new UserDTO(uid, upw, uname, ugender, ubirth, ulat, ulon, usignup, ukakao, ulike);
			return userInfo;
		} 
			finally {
			if(rs != null) pstmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	}
	
	
	// db에서 유저정보 삭제할 함수 - 정관
    public int delUser(String uid) throws NamingException, SQLException{
       Connection conn = null;
       PreparedStatement pstmt = null;
       
       try {
          String sql = "DELETE FROM user WHERE uid=?";
          
          conn = ConnectionPool.get();
          pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, uid);
          pstmt.executeUpdate();
          
          return 1;
       }finally {
          if(pstmt != null) pstmt.close();
          if(conn != null) pstmt.close();
       }
    }
    
    
	// 회원가입 - 민성
	public boolean userInsert(String uid, String upw, String uname, String ugender, String ubirth)
			throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			pstmt.setString(3, uname);
			pstmt.setString(4, ugender);
			pstmt.setString(5, ubirth);
			pstmt.setString(6, null);
			pstmt.setString(7, null);

			int result = pstmt.executeUpdate();

			return (result == 1 ? true : false);

		} finally {
			if (pstmt != null)
				pstmt.close();

			if (conn != null)
				conn.close();

		}
	}

	
	// 아이디 존재 여부 확인 - 민성
	public int idCheck(String uid) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {

			String sql = "SELECT uid, upw FROM user where uid = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				return 0;				// 회원정보가 없는 경우
			}
			else {
				return 1;
			}
			
		}
			finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

	}
	
	// 임시 비밀번호 설정 - 민성
	public boolean setTemPw(String uid, String temPw) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "UPDATE user SET upw = '" + temPw + "' WHERE uid = '" + uid +"'";  
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			boolean result = pstmt.execute();			
			return result;
		 // 이상 없는 경우
		} finally {

			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}


	
	

}
