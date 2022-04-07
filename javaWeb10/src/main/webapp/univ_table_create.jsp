<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%	request.setCharacterEncoding("utf-8");%>

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
	String url = "jdbc:mysql://localhost:3306/university";
	String id = "root";	
	String pw = "00000000";
	
	Connection conn = null;				// DB 연결 객체 
	PreparedStatement pstmt = null; 	// DB에 전달할 SQL 구문 객체 
	
	conn  = DriverManager.getConnection(url, id, pw);
 
 	String sql = "CREATE TABLE student("
		 + "hakbun int not null,"
		 + "name varchar(10),"
		 + "gender varchar(10),"
		 + "year tinyint," 
		 + "dept varchar(20),"
		 + "addr varchar(50),"
		 + "primary key(hakbun))";
 
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