<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%	request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 생성</title>
</head>
<body>
	<%
	// 드라이버 로딩 
	Class.forName("com.mysql.jdbc.Driver");

	// DB 연결 
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "00000000";

	Connection conn = null; // 연결 객체 
	PreparedStatement pstmt = null; // 구문 객체 

	conn = DriverManager.getConnection(url, id, pw);
	String sql = "CREATE DATABASE guest"; //db 생성 sql 구문
	pstmt = conn.prepareStatement(sql); // 구문을 객체에 넣어서 
	pstmt.executeUpdate(); // 구문객체 실행 

	if (conn != null) {
			conn.close();
			}
	
	%>
</body>
</html>