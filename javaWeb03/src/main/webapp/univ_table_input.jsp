<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>  
    
request.setChracterEncoding("UTF-8");

<%
//JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

//DB연결 
	String url = "jdbc:mysql://localhost:3306/univ";
	String id = "root";	
	String pw = "dpm9456@";
	
	Connection conn = null;				// DB 연결 객체 
	PreparedStatement pstmt = null; 	// DB에 전달할 SQL 구문 객체 
	
	conn  = DriverManager.getConnection(url, id, pw);
	
//	테이블 데이터 넣는 SQL
	
	String hakbun = request.getParameter("hakbun");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	
	
	String sql = "INSERT INTO student VALUES(?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,hakbun);
	pstmt.setString(2,name);
	pstmt.setString(3,dept);
	
	pstmt.executeUpdate();

	
//	DB 연결 종료 
	if (pstmt != null){
		pstmt.close();
	}
	
	if (conn != null){
		conn.close();
	}
	
	out.print("DB 데이터 삽입 성공 by 20서민성");
	
	response.sendRedirect("univ_table_input.html");






%>