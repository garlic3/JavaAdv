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
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css"
	rel="stylesheet">
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
	<%!String title = "게시판 작성";%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>

	<div class="container" style="padding-top: 30px;">
		<form name="newProduct" class="form-horizontal"
			action="boardwritedb.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group  row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-4">
					<input name="btitle" type="text" class="form-control"
						placeholder="Enter the Title">
				</div>
			</div>
<!-- 			<div class="form-group  row" style="display: none;">
				<label class="col-sm-2">작성자</label>
				<div class="col-sm-4">
					<input name="id" type="text" class="form-control" value="test"
						placeholder="Enter the name">
				</div>
			</div> -->
			<div class="container" style="padding-top: 30px;">
				<textarea name="bcontents" id="myEditor" class="form-control"></textarea>
			</div>


			<div class="form-group  row">
				<label class="col-sm-2">첨부파일</label>
				<div class="col-sm-4">
					<input name="bfilename" type="file" class="form-control">
				</div>
			</div>
			<div class="col-sm-offset-5 col-sm-5">
				<input type="submit" class="btn btn-dark" value="글쓰기 "> <input
					type="reset" class="btn btn-dark" value="취소" onclick="reset()">
			</div>

		</form>
	</div>

	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/lang/summernote-ko-KR.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#myEditor').summernote({
				lang : 'ko-KR',
				height : 250,
			});
		});
	</script>
</body>
</html>