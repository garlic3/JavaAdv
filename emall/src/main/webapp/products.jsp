<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="productDAO" class=jdbc.BoardDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품목록</h1>
<%

ArrayList<ProductDTO> listOfProducts =(new ProductDAO()).getAllProducts();


for(int i = 0; i < listOfProducts.size(); i++){
	ProductDTO product = listOfProducts.get(i);
	
%>

<%=product.getPname() %>
<%=product.getPdsec() %>
<%=product.getPprice() %>

<%} %>
</body>
</html>