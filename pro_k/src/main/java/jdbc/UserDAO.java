package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;

public class UserDAO {
	// db에서 회원정보를 불러올 함수
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
			//String id = rs.getString(1); //uid(아이디)
			//String upw = rs.getString(2); //upw(비밀번호)
			String uname = rs.getString(3); //uname(이름)
			String ugender = rs.getString(4); //ugender(성별)
			String ubirth = rs.getString(5); //ubirth(생년월일)
			
			UserDTO userDetail = new UserDTO(uname, ugender, ubirth);
			return userDetail;
		} finally {
			if(rs != null) pstmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	}
	
	// 유저 정보 가져오기
	public ArrayList<UserDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql="SELECT * FROM user ORDER BY uname DESC";
				
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			ArrayList<UserDTO> users = new ArrayList<UserDTO>();
			
			while(rs.next()) {
				users.add(new UserDTO(rs.getString("uid"),
									rs.getString("upw"),
									rs.getString("uname"),
									rs.getString("ugender"),
									rs.getString("ubirth"),
									rs.getString("usignup")));
			}
			return users;
		} finally {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}
	}
	
	// 로그인
	public int login(String uid, String upw) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT uid, upw FROM user where uid = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();

			if (!rs.next())
				return 1; // 회원 정보가 없는 경우
			else if (!upw.equals(rs.getString("upw")))
				return 2; // 비밀번호가 틀린 경우

			return 0; // 이상 없는 경우

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	// db에서 유저정보 삭제할 함수
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
}
