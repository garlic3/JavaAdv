<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 만들기</title>
</head>
<body>
<%
// JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

// DB연결 
	String url = "jdbc:mysql://localhost:3306/visit";
	String id = "root";	
	String pw = "dpm9456@";
	
	Connection conn = null;				// DB 연결 객체 
	PreparedStatement pstmt = null; 	// DB에 전달할 SQL 구문 객체 
	
	conn  = DriverManager.getConnection(url, id, pw);
	
// 테이블 만들기 
	

 	String sql = "CREATE TABLE feed("
		 + "name varchar(20) NOT NULL,"
		 + "content varchar(50) NULL DEFAULT NULL,"
		 + "ts TIMESTAMP NULL DEFAULT NULL,"
 		 + "primary key(name))";
 
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
 
	
//	DB 연결 종료 
	if (pstmt != null){
		pstmt.close();
	}
	
	if (conn != null){
		conn.close();
	}
		
%>
</body>
</html>