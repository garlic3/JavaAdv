<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin : 5px;
	}
	.container{
		border : solid 1px;
	}
</style>
</head>
<body>
<h2>kakaomap 위도/경도 입력</h2>
<div class="container">
	<form action="kakaomap3.jsp" method="post" >
		<ul>
			<li>
				<label name="lat">lat</label>
				<input type="text" name="lat">
			</li>
			<li>
				<label name="lng">lng</label>
				<input type="text" name="lng">
			</li>
			<li>
				<label name="msg">msg</label>
				<input type="text" name="msg">
			</li>
			<li>
				<label name="addr">addr</label>
				<input type="text" name="addr">
			</li>
			<div>
				<input type="submit" value="제출">
			</div>
		</ul>
	</form>
</div>
</body>
</html>