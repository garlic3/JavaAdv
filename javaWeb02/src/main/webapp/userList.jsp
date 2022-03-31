<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
 
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root","dpm9456@");

	/* 	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQurey("Select id, name From user");
 	*/	
 	
 	
 
%>