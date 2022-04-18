<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="login_form.jsp method="POST">
			<div>
				아이디<input type="text" name="uid" placeholder="아이디를 입력해주세요">
			</div>
			
			
			<div>

				비밀번호<input type="password" name="upw" placeholder="비밀번호를 입력해주세요">
			</div>

			<div>
				이메일 주소<input type="email" name="uemail"
					placeholder="E-mail 주소를 입력해주세요">
			</div>

			<input type="submit" value="회원가입">
		</form>
	</div>
</body>
</html>