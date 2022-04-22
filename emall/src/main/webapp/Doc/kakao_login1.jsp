<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
final String APP_KEY = "3fa68625aa2330372eff9b0aca380931";

%>

	<a id="custom-login-btn" href="javascript:kakaoLogin()"> <img
		src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
		width="222" />
	</a>


	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>Kakao.init("3fa68625aa2330372eff9b0aca380931");

function kakaoLogin() {
  console.log("login");
  Kakao.Auth.login({
    // 카카오 개발자 사이트의 동의항목에서 설정한 ID와 반드시 일치해야함
 scope: 'profile_nickname,account_email,gender,birthday',             
 success: function (authObj) {
      // 로그인 성공 시
      Kakao.API.request({
        // 사용자 정보를 가져온다.
          url: "/v2/user/me",
                 success: (res) => {
                   console.log("res:", res);
                   const kakaoAccount = res.kakao_account;
					location.href='/kakao_login_db.jsp?gender=' + kakaoAccount.gender 
											  + '&birthday=' + kakaoAccount.birthday
											  + '&mail=' + kakaoAccount.email;
/* 											  + '&nickname=' + kakaoAccount.profile_nickname;
 */
        },
      });
    },
  });
}

</script>
</body>
</html>