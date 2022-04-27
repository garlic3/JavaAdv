package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			uid = rs.getString(1);				//uid 아이디
			String upw = rs.getString(2); 		//upw(비밀번호)
			String uname = rs.getString(3); 	//uname(이름)
			String ugender = rs.getString(4); 	//ugender(성별)
			String ubirth = rs.getString(5); 	//ubirth(생년월일)
			String usignup = rs.getString(6);	//usignup(가입일자)

			
			UserDTO userInfo = new UserDTO(uid, upw, uname, ugender, ubirth,usignup);
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
	
	// 비밀번호 변경 - 민성
	public boolean changePw(String uid, String afterPw) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "UPDATE user SET upw = '" + afterPw + "' WHERE uid = '" + uid +"'";  
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
	
	

}
