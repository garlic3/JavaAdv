<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록 출력</title>
</head>
<body>
	<%
	//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	//DB연결 
	String url = "jdbc:mysql://localhost:3306/school";
	String id = "root";
	String pw = "00000000";

	Connection conn = null; // DB 연결 객체 
	PreparedStatement pstmt = null; // DB에 전달할 SQL 구문 객체 
	ResultSet rset = null;
	conn = DriverManager.getConnection(url, id, pw);

	//	테이블 데이터 넣는 SQL

	String sql = "SELECT * FROM emp";
	pstmt = conn.prepareStatement(sql);

	rset = pstmt.executeQuery();
	%>


	<form>
		<table>
			<caption>직원 목록</caption>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서</th>
			</tr>
			<tr>

				<%
				while (rset.next()) {

					String c_num = rset.getString("c_num");
					String name = rset.getString("name");
					String dept = rset.getString("dept");
				%>
			
			<tr>
				<td><%=c_num%></td>
				<td><%=name%></td>
				<td><%=dept%></td>
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