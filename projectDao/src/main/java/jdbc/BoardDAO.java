package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import jdbc.BoardDTO;
import util.ConnectionPool;

public class BoardDAO {
	// 게시물 삭제(관리자 페이지)
	public int delBoard(String bid) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM board WHERE bid=?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bid);
			pstmt.executeUpdate();
			
			return 1;
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	}
	
	// 게시물 여부 확인(관리자 페이지)
	public int isExist(String bid) throws NamingException, SQLException{
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
			String id = rs.getString(1); //bid(아이디)
				
			return 1;
		} catch(SQLException e){
			return 0;
		}
		finally {
			if(rs != null) pstmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	}
	
	// 모든 게시물 정보 불러오기(관리자 페이지)
	public ArrayList<BoardDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		try {
			String sql="SELECT * FROM board ORDER BY bts DESC";
				
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				boards.add(new BoardDTO(rs.getString("id"),
						rs.getString("content"),
						rs.getString("ts"),
						rs.getString("images"),
						rs.getString("videos"),
						rs.getString("latitude"),
						rs.getString("longitude"),
						rs.getString("uid")));
			}
			return boards;
		} finally {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}
	}
	
		// 해당 게시물 상세 정보 불러오기(관리자 페이지)
		public BoardDTO getDetail(String bid) throws NamingException, SQLException{
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
				String id = rs.getString(1); // 게시물 id
				String content = rs.getString(2); 
				String ts = rs.getString(3); 				
				String images = rs.getString(4); 
				String videos = rs.getString(5); 
				String latitude = rs.getString(6); 
				String longitude = rs.getString(7); 
				String uid = rs.getString(8); 
				
				BoardDTO boardDetail = new BoardDTO(id, content, ts, images, videos, latitude, longitude, uid);
				return boardDetail;
			} finally {
				if(rs != null) pstmt.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) pstmt.close();
			}
		}
	
		// 유저 정보에 따라  게시물 목록 불러오기(마이페이지)
		public ArrayList<BoardDTO> getMylist(String uid) throws NamingException, SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
				
			try {
				String sql="SELECT * FROM board WHERE uid=? ORDER BY ts DESC";
					
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, uid);
				rs = pstmt.executeQuery();
					
				ArrayList<BoardDTO> myboards = new ArrayList<BoardDTO>();
				
				while(rs.next()) {
					myboards.add(new BoardDTO(rs.getString("id"),
										rs.getString("content"),
										rs.getString("ts"),
										rs.getString("images"),
										rs.getString("videos"),
										rs.getString("latitude"),
										rs.getString("longitude"),
										rs.getString("uid")));
				}
				return myboards;
			} finally {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}
		}

}
