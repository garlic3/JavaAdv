package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ReplyDAO {

	// 해당 게시물의 댓글들 불러오기
	public ArrayList<ReplyDTO> getReply(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM reply WHERE bid = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();

			ArrayList<ReplyDTO> replies = new ArrayList<ReplyDTO>();

			while (rs.next()) {
				replies.add(new ReplyDTO(rs.getString("rid"), rs.getString("uid"), rs.getString("content"),
						rs.getString("ts")));
			}
			return replies;
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	
	// 댓글 DB에 저장하기
	public boolean replyInsert(String bid, String uid, String content) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			uid = "test";
			String sql = "INSERT INTO reply (bid, uid, content) VALUES(?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			pstmt.setString(2, uid);
			pstmt.setString(3, content);
			 
			int result = pstmt.executeUpdate();
			
			return (result == 1) ? true : false; 
			
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		}
	}
}
