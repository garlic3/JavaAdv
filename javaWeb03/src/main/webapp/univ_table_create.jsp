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
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root";	
	String pw = "dpm9456@";
	
	Connection conn = null;				// DB 연결 객체 
	PreparedStatement pstmt = null; 	// DB에 전달할 SQL 구문 객체 
	
	conn  = DriverManager.getConnection(url, id, pw);
	
// 테이블 만들기 
	
	 /* String sql = "CREATE TABLE professor("
			 + "p_num int not null,"
			 + "name varchar(10),"
			 + "dept varchar(20),"
			 + "tel char(11),"
			 + "primary key(p_num))";
 */
 
 	String sql = "CREATE TABLE student("
		 + "hakbun int not null,"
		 + "name varchar(10),"
		 + "dept varchar(20),"
		 + "primary key(p_num))";
 
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
 
	
//	DB 연결 종료 
	if (pstmt != null){
		pstmt.close();
	}
	
	if (conn != null){
		conn.close();
	}
	
	out.print("DB연결 문제없음 by 20서민성");
	
%>
</body>
</html>