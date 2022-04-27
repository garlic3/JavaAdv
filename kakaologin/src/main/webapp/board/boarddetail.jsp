<%@page import="jdbc.BoardDAO"%>
<%@page import="jdbc.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%@ include file="/_header.jsp"%>

	<!-- 표현문 -->
	<%!String title = "게시판 상세";%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));

	BoardDTO board = (new BoardDAO()).getDetail(bid);
	%>
	<table>
		<caption>게시판 상세보기</caption>
		<tr>
			<th>작성자</th>
			<td><%=board.getBuser()%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=board.getBtitle()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=board.getBcontents()%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=board.getBts()%></td>
		</tr>
	</table>
	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>