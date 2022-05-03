package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class FeedDAO {
	
	// 게시물 등록
	public boolean insert(String uid, String ucon, String ufname, String uvname, String la, String lo) throws NamingException,SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql="INSERT INTO board(uid,content,images,videos, latitude, longitude) VALUES(?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, ucon);
				pstmt.setString(3, ufname);
				pstmt.setString(4, uvname);
				pstmt.setString(5, la);
				pstmt.setString(6, lo);
			int count = pstmt.executeUpdate(); // 정보가 넘어오지는 않지만 성공과 실패가 0 과 1로 넘어온다
			return (count>0) ? true : false;
		}finally {
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}
	}
	
	// 게시물 자세히 보기
	public ArrayList<FeedDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT * FROM board ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();
		
			while(rs.next()) {
				feeds.add(new FeedDTO(rs.getString("bid"),
									  rs.getString("uid"),
									  rs.getString("content"),
									  rs.getString("ts"),
									  rs.getString("images"),
									  rs.getString("videos"),
									  rs.getString("latitude"),
									  rs.getString("longitude")));
			}
			return feeds;
		} finally {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		}
	}
	
	
	
}
