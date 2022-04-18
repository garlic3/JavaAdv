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
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3">

	<form action="user_add_beans.jsp" method="post">
		<div class="form-group row">
			<label class="col-sm-3">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="uid" class="form-control">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="text" name="upw" class="form-control">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input type="text" name="uname" class="form-control">
			</div>

		</div>
		<div class="form-group  row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-3">
				<input name="ugender" type="radio" value="여자">여자 <input
					name="ugender" type="radio" value="남자">남자

			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">생년월일</label>
			<div class="col-sm-3">
				<input type="date" name="ubirth" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">email</label>
			<div class="col-sm-3">
				<input type="email" name="uemail" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-3">
				<input type="text" name="uphone" class="form-control">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-3">
				<input type="text" name="uaddr" class="form-control">
			</div>
		</div>

		<div class="col-sm-offset-5 col-sm-5">
			<input type="submit" class="btn btn-dark" value="회원가입 ">
		</div>
	</form>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>