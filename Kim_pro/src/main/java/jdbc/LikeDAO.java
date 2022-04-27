package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class LikeDAO {
	// 좋아요한 게시물 목록
		public ArrayList<LikeDTO> getLike(String uid) throws NamingException, SQLException{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT board.*" 
						+ "FROM `board`"  
						+ "WHERE id IN (SELECT bid FROM `like` WHERE uid=?)";
				
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, uid);
				rs = pstmt.executeQuery();
				
				ArrayList<LikeDTO> likes = new ArrayList<LikeDTO>();
				
				while(rs.next()) {
					likes.add(new LikeDTO(rs.getString("id"),
							rs.getString("content"),
							rs.getString("ts"),
							rs.getString("images"),
							rs.getString("videos"),
							rs.getString("latitude"),
							rs.getString("longitude"),
							rs.getString("uid")));
				}
				
				return likes;
			} finally {
				if(rs != null) pstmt.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) pstmt.close();
			}
		}	
}
