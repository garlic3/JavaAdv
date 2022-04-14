<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지"</title>

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
	<%!String title = "게시판 상세페이지";%>
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
	String bid = request.getParameter("bid");
	out.print(bid);
	BoardDTO board = (new BoardDAO()).getDetail(bid);
	%>
	<div class="p-5 mb-4 bg-light rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold"><%=board.getBtitle() %></h1>
			<p class="col-md-10 fs-4"><%=board.getBcon() %></p>
			<span class="col-md-8 fs-5">작성자:&nbsp<%=board.getBname() %></span><br>
			<span class="col-md-8 fs-5">(작성일시:&nbsp<%=board.getBts() %>)</span><br><br>
			
			<a href = "board_list.jsp" class= "btn btn-warning">목록으로 돌아가기</a>
		</div>
	</div>

	<%@ include file="/_footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>