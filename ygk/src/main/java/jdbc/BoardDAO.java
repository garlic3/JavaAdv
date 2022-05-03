package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {

	// 1. 게시물 등록
	public boolean postInsert(String uid, String content, String fname, String vname, String lat, String lon)
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO board(uid,content,images,videos, lat, lon) VALUES(?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, content);
			pstmt.setString(3, fname);
			pstmt.setString(4, vname);
			pstmt.setString(5, lat);
			pstmt.setString(6, lon);
			int count = pstmt.executeUpdate(); // 정보가 넘어오지는 않지만 성공과 실패가 0 과 1로 넘어온다
			return (count > 0) ? true : false;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	// 2. 모든 게시물 정보 불러오기
	public ArrayList<BoardDTO> allPost() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board ORDER BY ts DESC";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<BoardDTO> feeds = new ArrayList<BoardDTO>();

			while (rs.next()) {
				feeds.add(new BoardDTO(rs.getString("bid"), rs.getString("uid"), rs.getString("content"),
						rs.getString("ts"), rs.getString("images"), rs.getString("videos"), rs.getString("lat"),
						rs.getString("lon")));
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

	// 3. 게시물 상세 정보 불러오기
	public BoardDTO getPostDetail(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board WHERE bid=?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();

			rs.next();
			bid = rs.getString(1);
			String uid = rs.getString(2); // 작성자
			String content = rs.getString(3); // 내용
			String ts = rs.getString(4); // 작성 시간
			String images = rs.getString(5); // 이미지
			String videos = rs.getString(6); // 비디오
			String lat = null;
			String lon = null;

			BoardDTO boardDetail = new BoardDTO(bid, uid, content, ts, images, videos, lat, lon);
			return boardDetail;

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		}
	}

	// 4. 게시물 삭제(관리자 페이지)
	public int delPost(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "DELETE FROM board WHERE bid=?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			pstmt.executeUpdate();

			return 1;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				pstmt.close();
		}
	}

	// 5. 게시물 여부 확인(관리자 페이지)
	public int isExist(String bid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT bid FROM board WHERE bid=?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();

			rs.next();
			String id = rs.getString(1); // bid(아이디)

			return 1;
		} catch (SQLException e) {
			return 0;
		} finally {
			if (rs != null)
				pstmt.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				pstmt.close();
		}
	}

	// 6. 유저 정보에 따라 게시물 목록 불러오기(마이페이지)
	public ArrayList<BoardDTO> getMylist(String uid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board WHERE uid=? ORDER BY ts DESC";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();

			ArrayList<BoardDTO> myboards = new ArrayList<BoardDTO>();

			while (rs.next()) {
				myboards.add(new BoardDTO(rs.getString("id"), rs.getString("content"), rs.getString("ts"),
						rs.getString("images"), rs.getString("videos"), rs.getString("lat"),
						rs.getString("lon"), rs.getString("uid")));
			}
			return myboards;
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
