<%@page import="jdbc.ProductDAO"%>
<%@page import="jdbc.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = (String)session.getAttribute("id");
	if(uid == null){
		response.sendRedirect("/user/login.jsp");
	} // 세션 정보를 확인해서 로그인 산태인지 확인 후 진입
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<%@ include file = "/_header.jsp" %>
	
	<!-- 표현문 -->
	<%! String title = "상품 목록";%>	
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>
	<%
		ArrayList<ProductDTO> products = (new ProductDAO()).getList();
		
		
		// for문
		for(ProductDTO product : products){
	%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-3">
				<img alt="사진없음" src="/images/<%=product.getPimage()%>" style="width:100%">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getPprice()%>원</p>
				<p>
					<a href="productdetail.jsp?pid=<%=product.getPid() %>" class="btn btn-secondary" role="button">상세정보</a>
				</p>
			</div>
		</div>
	</div>
	<%
		}
	%>
	<%@ include file = "/_footer.jsp" %>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>