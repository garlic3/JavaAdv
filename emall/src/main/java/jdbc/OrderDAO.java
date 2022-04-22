package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class OrderDAO {
	
	public ArrayList<OrderDTO> getList(String ostatus, String ouid) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "";
			if (ostatus == "") {
			sql = "SELECT * FROM `order`";
			} else{
				sql = "SELECT * FROM `order` WHERE ostatus='" + ostatus + "'";
			}
			
			if (ouid != "") {
			sql = "SELECT * FROM `order` WHERE ouid ='" + ouid + "'";
			}
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<OrderDTO> order = new ArrayList<OrderDTO>();

			while (rs.next()) {
				order.add(new OrderDTO(rs.getString("oid"), rs.getString("opid"), rs.getString("ouid"),
						rs.getString("opname"), rs.getString("oprice"), rs.getString("ostatus"), 
						rs.getString("odate"), rs.getString("ograde"), rs.getString("ocomm") 
						));
			}
			
			
			return order;
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
	

	
	// 구매 시작 메서드
	public int insert() {
		
		
		
		
		return 1;
	}
	
	// 입금 확인 status1 고객 메서드
	public int confrm() {
		
		
		return 1;
	}
	
	// 발송 status2 판매자 매서드 
	public int delivery() {
		
		
	return 1;
	}
	
	// 리뷰 status4 고객 매서드
}
