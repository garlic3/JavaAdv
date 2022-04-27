package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class FeedDAO {
	public boolean insert(String uid, String ucon, String ufname, String uvname, String la, String lo) throws NamingException,SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql="INSERT INTO feed(id,content,images,videos,latitude,longitude) VALUES(?,?,?,?,?,?)";
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
	
	public ArrayList<FeedDTO> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql="SELECT * FROM feed ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<FeedDTO> feeds = new ArrayList<FeedDTO>();
		
			while(rs.next()) {
				feeds.add(new FeedDTO(rs.getString("id"),
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