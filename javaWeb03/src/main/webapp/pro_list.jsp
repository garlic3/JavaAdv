<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 목록 출력</title>
</head>
<body>
	<%
	//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	//DB연결 
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root";
	String pw = "dpm9456@";

	Connection conn = null; // DB 연결 객체 
	PreparedStatement pstmt = null; // DB에 전달할 SQL 구문 객체 
	ResultSet rset = null;
	conn = DriverManager.getConnection(url, id, pw);

	//	테이블 데이터 넣는 SQL

	String sql = "SELECT * FROM professor";
	pstmt = conn.prepareStatement(sql);

	rset = pstmt.executeQuery();
	%>

	<form>
		<table>
			<caption>교수 목록</caption>
			<tr>
				<th>교번</th>
				<th>이름</th>
				<th>전공</th>
				<th>전화번호</th>
			</tr>
			<tr>

				<%
				while (rset.next()) {

					String p_num = rset.getString("p_num");
					String name = rset.getString("name");
					String dept = rset.getString("dept");
					String tel = rset.getString("tel");
				%>
			
			<tr>
				<td><%=p_num%></td>
				<td><%=name%></td>
				<td><%=dept%></td>
				<td><%=tel %></td>
			</tr>

	<%
	}
	%>
	
		</table>
	</form>
	
	<%
	//	DB 연결 종료 
	if (pstmt != null) {
		pstmt.close();
	}

	if (conn != null) {
		conn.close();
	}

	%>

</body>
</html>