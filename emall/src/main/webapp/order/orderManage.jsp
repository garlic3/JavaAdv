<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!String title = "자유게시판";%>
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
	<div class="container shadow bg-light mx-auto mt-5 p-5">
		<div align="right">
		<a herf="order_status.jsp?status="1">[입금전]</a> 
		<a herf="order_status.jsp?status="1">[입금완료]</a>
		<a herf="order_status.jsp?status="1">[배송중]</a>
		<a herf="order_status.jsp?status="1">[배송완료]</a>
		</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">제품번호</th>
					<th scope="col">구매자</th>
					<th scope="col">제품명</th>
					<th scope="col">가격</th>
					<th scope="col">구매일</th>
					<th scope="col">평점</th>
					<th scope="col">후기</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<%
			ArrayList<OrderDTO> orders = (new OrderDAO()).getList("", "");

			for (OrderDTO order : orders) {
			%>
			<tbody>
				<tr>
					<th scope="row"><%=order.getOid()%></th>
					<th scope="row"><%=order.getOpid()%></th>
					<th scope="row"><a href="orderManage.jsp?ouid=<%=order.getOuid()%>"><%=order.getOuid() %></a></th>
					<th scope="row"><%=order.getOpname()%></th>
					<th scope="row"><%=order.getOpprice()%></th>
					<th scope="row"><%=order.getOdate()%></th>
					<th scope="row"><%=order.getOgrade()%></th>
					<th scope="row"><%=order.getOcomm()%></th>

					<td><a href="orderd_delivery.jsp?satus="><%=order.getOstatus()%>[발송]</a></td>

				</tr>
				<%
				}
				%>


			</tbody>
		</table>

	</div>
</body>
</html>