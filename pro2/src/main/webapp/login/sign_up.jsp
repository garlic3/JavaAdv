<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">

<meta charset="UTF-8">
<title>요기콕 회원가입</title>
</head>
<body>
	<div class="container">
		<form name="sign_up" action="sign_up_db.jsp" method="POST" onsubmit="signUpOk();">
			<span>* 필수 입력 사항</span>
			<div>
				아이디*&nbsp <input type="text" name="uid" placeholder="이메일 주소"
					required><button type="button" onclick="idCheck();" id="id">중복확인</button>
					<span class="hidden" hidden="hidden">중복된 아이디 입니다</span>
					<span class="hidden" hidden="hidden">사용가능한 아이디 입니다</span>
			</div>

			<div>
				비밀번호*&nbsp <input type="password" name="upw" placeholder="비밀번호"
					required>
			</div>
			<div>
				사용자 이름*&nbsp <input type="text" name="uname" required>

			</div>

			<div>
				성별<input type="radio" name="ugender" value="남자">남<input
					type="radio" name="ugender" value="여자">여자
			</div>

			<div>
				생년월일&nbsp <input type="date" name="ubirth">

			</div>
			<span> 가입시 요기콕의 약관, 데이터 정책 및 쿠키정책에 동의하게 됩니다</span>
			<div>
			<input type="submit" value="회원가입"></div>
		</form>
	</div>
	
	<script>
	
	function signUpOk(){
		alert("회원가입 성공");
		
	}
	
	function idCheck() {
		
		let overlap = document.getElementById("id")
		if (document.getElementById("id") != "text") /* 아이디 중복확인 버튼 클릭시 */
		alert("아이디 중복");
	}
	
	</script>
</body>
</html>