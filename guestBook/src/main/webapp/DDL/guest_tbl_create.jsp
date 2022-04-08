<%@page import="java.sql.*"%>
<%@page import="dbconnclose.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 테이블 생성</title>
</head>
<body>
<%
Connection conn=null;           //연결 객체
PreparedStatement pstmt = null; //구문 객체
conn = DbConnClose.getConnection();
	String sql = "CREATE TABLE visitor ("
			+"guest_id		varchar(10) NOT NULL,"
			+"guest_pw    	varchar(15),"
			+"guest_name    varchar(30),"
			+"primary key(guest_id))";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	DbConnClose.resourceClose(pstmt, conn);
%>

</body>
</html>