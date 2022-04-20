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

	<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
		src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="222" alt="카카오 로그인 버튼" />
	</a>
	<p id="token-result"></p>
	
	
	
	<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth'
    })
  }
  
</script>

</body>
</html>