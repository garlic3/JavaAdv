<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
// 데이터베이스 연결 테스트 
	try {
	Class.forName("com.mysql.jdbc.Driver");
	out.print("JDBC Driver loading 성공!!<br>");
	} catch (ClassNotFoundException err){
		out.print("JDBC Driver loading 실패..");
	}
// DB 연결 
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "dpm9456@";
	
	Connection conn = null;
	
	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.print("SQL DB 연결 성공!! by 20서민성<br>");
	} catch(SQLException sqlerr){
		out.print("SQL DB 연결 실패..<br>");
	} finally {
		// 데이터베이스 연결 종료
		if (conn != null){
			try {
				conn.close();
				out.print("SQL DB 연결 종료!!<br>");
				
			}catch (Exception conerr){
				conerr.printStackTrace();
			}
		}
	}
	
%>

</body>
</html>