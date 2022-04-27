package jdbc;

import jdbc.*;
import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class FeedDAO {
	// 게시물 등록
	public boolean insert(String uid, String ucon, String ufname, String uvname, String la, String lo)
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO board(uid,content,images,videos,latitude,longitude) VALUES(?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, ucon);
			pstmt.setString(3, ufname);
			pstmt.setString(4, uvname);
			pstmt.setString(5, la);
			pstmt.setString(6, lo);
			int count = pstmt.executeUpdate(); // ������ �Ѿ������ ������ ������ ���а� 0 �� 1�� �Ѿ�´�
			return (count > 0) ? true : false;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	// 모든 게시물 정보 불러오기
	public ArrayList<FeedDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board ORDER BY ts DESC";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();

			while (rs.next()) {
				feeds.add(new FeedDTO(rs.getString("id"), rs.getString("content"), rs.getString("ts"),
						rs.getString("images"), rs.getString("videos"), rs.getString("latitude"),
						rs.getString("longitude")));
			}
			return feeds;
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	// 게시물 상세 정보 불러오기
	public FeedDTO getBoardDetail(String id) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM board WHERE id=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			id = rs.getString(1);
			String uid = rs.getString(2); 		// 작성자 
			String content = rs.getString(3); 	// 내용
			String ts = rs.getString(4); 		// 작성 시간
			String images = rs.getString(5); 	// 이미지 
			String videos = rs.getString(6);	// 비디오
			String latitude = null;
			String longitude = null;
			
			FeedDTO boardDetail = new FeedDTO(id, uid, content, ts, images, videos, latitude, longitude);
			return boardDetail;

		}finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
	
		}
	}
}