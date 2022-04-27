<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="container">
	<form action="login_db2.jsp" method="get">

		<div>
			아이디 <input type="text" name="uid" required>
		</div>
		<div>
			비밀번호 <input type="password" name="upw" required>
		</div>

		<div>
			<input type="submit" value="로그인">
		</div>

		<div>
			<button type="button">회원가입</button>
			<a href="forget_id.jsp">아이디 찾기</a> 
			<a href="forget_pw.jsp">비밀번호를 잊으셨나요?</a>
			</div>
			
	</form>
	<a id="custom-login-btn" href="javascript:kakaoLogin()">
      <img
        src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
        width="222"
      />
    </a>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
// 발급 받은 키
      Kakao.init("eb87d531ac2ccb7011e1e6d0d8a328e3");

      function kakaoLogin() {
        window.Kakao.Auth.login({
          // 카카오 개발자 사이트의 동의항목에서 설정한 ID와 반드시 일치해야함
          scope: 'profile_nickname,account_email,gender,birthday',
          success: function (authObj) {
                window.Kakao.API.request({
                url:'/v2/user/me',
                success: res => {
                    const kakaoAccount = res.kakao_account;
					location.href = 'login_db2.jsp?kid=' + kakaoAccount.email;
							/* gender=' + kakaoAccount.gender
					+ '&birthday=' + kakaoAccount.birthday */
					/* + '&nickname=' + kakaoAccount.profile.nickname; */
					
                }
                });


          }
        });
      }
      </script>	
</body>
</html>





