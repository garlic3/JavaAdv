<%@page import="jdbc.ProductDAO"%>
<%@page import="jdbc.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
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
	<%!String title = "회원 가입";%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>

	<div class="container">
		<form action="useradddbbeans.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="uid" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="text" name="upw" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="uname" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-3">
					<input class="form-check-input" value="m" type="radio" name="ugender" id="flexRadioDefault1" checked>
  						<label class="form-check-label" for="flexRadioDefault1">
					    	남자
					    </label>
					<input class="form-check-input" value="w" type="radio" name="ugender" id="flexRadioDefault2" checked>
  						<label class="form-check-label" for="flexRadioDefault2">
					    	여자
					    </label>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-3">
					<input type="text" name="ubirth" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<textarea name="uaddr" class="form=col-sm-2" rows="5" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input name="uemail" class="form=col-sm-2">
				</div>
			</div>			
			<div class="form-group row" align="center">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="회원가입">
					<input type="reset" class="btn btn-danger" value="취소">
				</div>
			</div>
		</form>
	</div>

	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>