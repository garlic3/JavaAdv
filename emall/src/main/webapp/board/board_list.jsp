<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<style>

.body{
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
}
</style>
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
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">글제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일시</th>
				</tr>
			</thead>
			<%
			
			ArrayList<BoardDTO> board = (new BoardDAO()).getList();
			for (BoardDTO b : board) {
			int i = 1; 
			
			%>
			<tbody>
				<tr>
					<th scope="row"><%=b.getBid() %></th>
					<td><a href="board_detail.jsp?bid=<%=b.getBid() %>"><%=b.getBtitle() %></a></td>
					<td><%=b.getBid() %></td>
					<td><%=b.getBts()%></td>
				</tr>
			<%
			}%>
			
			
			</tbody>
		</table>
				<a href = "board_write.jsp" class= "btn btn-warning">글작성하기</a>
	
	</div>
	
	<%@ include file="/_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>