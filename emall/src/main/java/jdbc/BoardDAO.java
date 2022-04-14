package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {

	private ArrayList<BoardDTO> boardlist = new ArrayList<BoardDTO>();

	public ArrayList<BoardDTO> getList() throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<BoardDTO> board = new ArrayList<BoardDTO>();

			while (rs.next()) {
				board.add(new BoardDTO(rs.getString("bid"), rs.getString("bname"), rs.getString("btitle"),
						rs.getString("bcon"), rs.getString("bts")));
			}
			return board;
			
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

	public BoardDTO getDetail(String bid) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM board WHERE bid = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bid);
			rs = pstmt.executeQuery();

			rs.next();

			String id = rs.getString(1);
			String bname = rs.getString(2);
			String btitle = rs.getString(3);
			String bcon = rs.getString(4);
			String bts = rs.getString(5);
			
			BoardDTO board = new BoardDTO(id, bname, btitle, bcon, bts);

			return board;

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

}