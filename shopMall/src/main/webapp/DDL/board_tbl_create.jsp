<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dbconnclose.*"%>
<%	request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null; // 구문 객체 
conn = DbConnClose.getConnection();

	String sql = "CREATE TABLE board("
			+ "board_id varchar(10) NOT NULL,"
			+ "board_name varchar(15),"
			+ "board_title varchar(100),"
			+ "board_content varchar(300),"
			+ "board_join_date date,"
			+ "primary key(board_id))";
			
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	DbConnClose.resourceClose(pstmt,conn);
	

%>
</body>
</html>