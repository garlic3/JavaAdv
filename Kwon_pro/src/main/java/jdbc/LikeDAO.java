package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class LikeDAO {

	public boolean liked(String uid, String bid, String ulike, String uwatch)
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO like(uid,bid,ulike,uwatch) VALUES(?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, bid);
			pstmt.setString(3, ulike);
			pstmt.setString(4, uwatch);
			int count = pstmt.executeUpdate(); // 
			return (count > 0) ? true : false;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

}
