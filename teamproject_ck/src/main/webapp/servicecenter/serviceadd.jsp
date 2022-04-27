<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/ygk";
	String id = "root";
	String pw = "00000000";
	
	Connection conn = null;  
	PreparedStatement pstmt = null; // 
	
	conn = DriverManager.getConnection(url, id, pw);
	

	String sertitle = request.getParameter("sertitle");
	String sercontent = request.getParameter("sercontent");
	String seremail = request.getParameter("seremail");

	String sql = "INSERT INTO servicecenter VALUES(?,?,?)";
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sertitle);
		pstmt.setString(2, sercontent);
		pstmt.setString(3, seremail);
	
	pstmt.executeUpdate(); 
	
	

	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();

	
%>