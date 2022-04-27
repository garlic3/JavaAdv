<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao login 1</title>
</head>
<body>
	<!-- b47e5184b9d2146be5c8621f5ee7c9a3 -->
	<a id="custom-login-btn" href="javascript:kakaoLogin()">
	  <img
	    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
	    width="222"
	    alt="카카오 로그인 버튼"
	  />
	</a>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init("b47e5184b9d2146be5c8621f5ee7c9a3");
		
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope: 'profile_nickname,account_email,gender,birthday',
				success: function(authObj){
					console.log(authObj);
					window.Kakao.API.request({
						url:'/v2/user/me',
						success:res=>{
							const kakaoAccount = res.kakao_account;
							/* console.log(kakaoAccount);
							
							alert("로그인 성공"); */
							location.href='/kakaologindb.jsp?gender=' + kakaoAccount.gender
														+ '&birthday=' + kakaoAccount.birthday
														+ '&email=' + kakaoAccount.email
														+ '&nickname=' + kakaoAccount.profile.nickname;
						}
					})
				}
			})
		}
	</script>
</body>
</html>