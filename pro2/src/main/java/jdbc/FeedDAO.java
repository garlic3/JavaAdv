package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class FeedDAO {
	public boolean insert(String uid, String ucon, String ufname, String uvname, String la, String lo, String like)
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		boolean var12;
		try {
			String sql = "INSERT INTO board(id,content,images,videos, latitude, longitude, like) VALUES(?,?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, ucon);
			pstmt.setString(3, ufname);
			pstmt.setString(4, uvname);
			pstmt.setString(5, la);
			pstmt.setString(6, lo);
			pstmt.setString(7, like);

			int count = pstmt.executeUpdate();
			var12 = count > 0;
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}

		}

		return var12;
	}

	public ArrayList<FeedDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board ORDER BY ts DESC";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<FeedDTO> feeds = new ArrayList();

			while (rs.next()) {
				feeds.add(new FeedDTO(rs.getString("id"), rs.getString("content"), rs.getString("ts"),
						rs.getString("images"), rs.getString("videos"), rs.getString("latitude"),
						rs.getString("longitude"),rs.getString("like")));
			}

			ArrayList<FeedDTO> var7 = feeds;
			return var7;
		} finally {
			if (rs != null) {
				rs.close();
			}

			if (pstmt != null) {
				pstmt.close();
			}

			if (conn != null) {
				conn.close();
			}

		}
	}
}