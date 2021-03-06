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

	// 회원가입
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

	
	// 아이디 존재 여부 확인 
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
				return 1;				// 회원정보가 없는 경우
			}
			else {
				return 0;
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
	
	// 임시 비밀번호 설정
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


	
	// 아이디 찾기
	public String findId(String uid) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT uid FROM user WHERE uid = ?"; // 아이디 존재 여부 확인 sql
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();

			if (!rs.next())
				return ""; // 회원 정보가 없는 경우
			else {
				sql = "SELECT uname FROM user WHERE uid='" + uid + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				String uname = rs.getString(1);
				return uname;

			} // 이상 없는 경우
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

}
