<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
</head>
<body>
	<%!String title = "상품 상세페이지";%>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<%@ include file="/_header.jsp"%>

	<div class="alert alert-primary" role="alert"
		style="text-align: center;">
		<%=title%>
	</div>

	<%
	String pid = request.getParameter("pid");

	ProductDTO product = (new ProductDAO()).getDetail(pid);
	
	
	%>
	
	<div class="p-5 mb-4 bg-light rounded-3" style="display:flex;">
		<div class="container-fluid py-3" style="width:600px;">
			<h1 class="display-5 fw-bold"><%=product.getPname() %></h1>
			<p class="col-md-8 fs-4"><%=product.getPdsec() %></p>
			<span class="col-md-8 fs-4"><%=product.getPmanu() %></span>
			<span class="col-md-8 fs-4">(<%=product.getPcondi() %>)</span>
			<p class="col-md-8 fs-4"><%=product.getPprice() %>원</p>
			<button class="btn btn-primary" type="button">장바구니</button>
			<button class="btn btn-primary" type="button" onclick="location.href='order.jsp'">구매하기</button>
			<a href = "product_list.jsp" class= "btn btn-warning">목록으로 돌아가기</a>
		</div>
			<img src="/images/<%=product.getPimage() %>" width=300px height=300px>
	</div>

	<%@ include file="/_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>