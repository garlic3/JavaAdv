<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
</head>
<body>
	<%!String title = "상품 목록";%>
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
String pname = request.getParameter("pname");
String pprice = request.getParameter("pprice");



%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-3">
				<!-- 4개씩 배치 -->
				<img src="" style="width: 100%">

				</p>
			<img src="/images/<%=product.getPimage()%>" width=200px height=200px;>
				
				<a href="product_detail.jsp?pid=<%=product.getPid()%>"
					class="btn btn-secondary" role="button" style="margin-top:20px;">상세 정보 보기</a>
			</div>
			
		</div>

	</div>

	<%@ include file="/_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>