<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@700&display=swap')
	;

body {
	font-family: 'Merriweather Sans', sans-serif;
}

h3 {
	color: white;
}
</style>
</head>

<body>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<div class="container bg-success shadow mx-auto mt-5 p-5 w-75">

		<form action="feedadd.jsp" method="POST">
			<h3>방명록을 남겨주세요🐕🦮🐕‍🦺🐈</h3>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">작성자</label>
				<input type="text" class="form-control"
					id="exampleFormControlInput1" placeholder="이름을 입력해주세요" name="name">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">방명록
					내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" name="content"></textarea>

			</div>
			<div class="mb-3">
				<input type="submit" value="방명록 등록">
			</div>

			<!-- <table align=center>
			<tr height=40>
				<td colspan=2 align=center class=my><b>ë°©ëªë¡ ìì±ðð¦®ðâð¦ºð<b></td>
				<td align=right></td>
			</tr>
			<tr>
				<td>ìì±ì ì´ë¦</td>
				<td><input type="text" name="name" placeholder="ì´ë¦ì ìë ¥íì¸ì"
					required></td>
			</tr>
			<tr>
				<td>ë°©ëªë¡ ë´ì©</td>
				<td><input type="text" name="content"></td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type="submit" value="ë°©ëªë¡ ë±ë¡">
				</td>
			</tr>
		</table>
	</form>
 -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
		</form>
	</div>
</body>
</html>