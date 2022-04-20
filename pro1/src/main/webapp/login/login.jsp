<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login_db.jsp" method="post">

		<div>
			아이디 <input type="text" name="uid">
		</div>
		<div>
			비밀번호 <input type="password" name="upw">
		</div>

		<div>
			<input type="submit" value="로그인">
		</div>

		<div>
			<button type="button">회원가입</button>
			<a href="forget_id.jsp">아이디 찾기</a> 
			<a href="forget_pw.jsp">비밀번호 찾기</a>
			</div>
	</form>

	<script type="text/javascript">
		
	</script>
</body>
</html>