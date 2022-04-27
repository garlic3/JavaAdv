// db 저장용(sql 고쳐야함)

package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class smallDAO {
	/*
	public boolean insert(String uid, String ucon, String ufname) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO user(uid,upw,num) VALUES(?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, ucon);
			pstmt.setString(3, ufname);
			int count = pstmt.executeUpdate(); // 정보가 넘어오지는 않지만 성공과 실패가 0 과 1로 넘어온다
			return (count > 0) ? true : false;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	*/
	
	
	public ArrayList<smallDTO> getList(String sql) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// String sql="SELECT * FROM test";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<smallDTO> feeds = new ArrayList<smallDTO>();
		
			while(rs.next()) {
				feeds.add(new smallDTO(rs.getInt("num"),
									  rs.getDouble("lan"),
									  rs.getDouble("lon"),
									  rs.getString("content")));
			}
			return feeds;
	} finally {
		if(rs !=null) rs.close();
		if(pstmt !=null) pstmt.close();
		if(conn !=null) conn.close();
	}
}
	
	
	

}
