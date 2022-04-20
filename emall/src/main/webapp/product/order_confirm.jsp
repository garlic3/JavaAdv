<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>

	<%
	String pid = request.getParameter("pid");

	ProductDTO product = (new ProductDAO()).getDetail(pid);
	
	
	%>
	<%!String title = "상품 주문";%>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<%@ include file="/_header.jsp"%>
	
<h1 class="display-5 fw-bold"><%=product.getPname() %></h1>
			<p class="col-md-8 fs-4"><%=product.getPdsec() %></p>
			<span class="col-md-8 fs-4"><%=product.getPmenu() %></span>
			<span class="col-md-8 fs-4">(<%=product.getPcondi() %>)</span>
			<p class="col-md-8 fs-4"><%=product.getPprice() %>원</p>	
	
	
	
	</div>
	
	<%@ include file="/_footer.jsp" %>


</body>
</html>