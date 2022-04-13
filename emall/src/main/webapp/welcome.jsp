<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="_header.jsp"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<!-- CSS only -->


	
	<%!// 선언문 (선언문: 전역변수 스크립틀릿: 지역변수)
	String greeting = "Welcome to e-MALL";
	String tagline = "Welcome to Web Market!!";%>

	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<div class="text-center">

				<h2 class="display-3">
					<%=greeting%>
				</h2>
			</div>
		</div>
	</div>
	<div class="containter">
		<div class="text-center">
			<h3><%=tagline%></h3>
			<%
			Date day = new Date();
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();

			String CT = hour + ":" + minute + ":" + second;
			out.print("현재 접속 시각: " + CT + "\n");
			%>

		</div>

	</div>

	<!-- JavaScript Bundle with Popper -->
	
	<%@ include file="_footer.jsp"%>

</body>

</html>