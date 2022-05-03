package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class LikeDAO {

	public boolean likeInsert(String uid, String bid) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO plike(uid, bid) VALUES(?,?)";
		
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, bid);
	;
		
			int result = pstmt.executeUpdate();
			return (result == 0) ? true : false;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

	}
}
