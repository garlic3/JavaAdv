package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import util.ConnectionPool;

public class BoardDAO {
	// db에서 게시물 삭제할 함수
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
	
	// db에서 게시물의 존재를 확인할 함수
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
}
