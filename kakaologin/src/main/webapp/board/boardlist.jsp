<%@page import="jdbc.BoardDAO"%>
<%@page import="jdbc.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<%!String title = "게시판";%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>
	<%
		ArrayList<BoardDTO> boards = (new BoardDAO()).getList();
		
	// for문
	for (BoardDTO board : boards) {
	%>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><%=board.getBid()%></th>
				<td><%=board.getBuser()%></td>
				<td><a href="boarddetail.jsp?bid=<%=board.getBid()%>"><%=board.getBtitle()%></a></td>
				<td><%=board.getBts()%></td>
			</tr>
		</tbody>
	</table>
	<%
		}
	%>
	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>