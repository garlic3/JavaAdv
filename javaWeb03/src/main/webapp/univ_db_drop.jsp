<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	// 드라이버 로딩 
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.print("JDBC Driver loading 성공!! by 20서민성<br>");
	} catch (ClassNotFoundException err){
		out.print("JDBC Driver loading 실패..");
	}


	// DB 연결 
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "dpm9456@";
	
	Connection conn = null;		// 연결 객체 
	PreparedStatement pstmt = null;		// 구문 객체 
	
	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.print("SQL DB 연결 성공!! by 20서민성<br>");
		
		String sql = "DROP DATABASE univ2"; //db 생성 sql 구문
		pstmt = conn.prepareStatement(sql); // 구문을 객체에 넣어서 
		
		pstmt.executeUpdate(); // 구문객체 실행 
		
		out.print("univ2 데이터베이스 삭제 성공!! by 20서민성<br>");
		
		
		
	} catch(SQLException sqlerr){
		out.print("univ2 데이터베이스 생성 성공 실패..<br>");
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