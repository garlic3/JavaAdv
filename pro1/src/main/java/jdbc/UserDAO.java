package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {

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
			if (!upw.equals(rs.getString("upw")))
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

}
