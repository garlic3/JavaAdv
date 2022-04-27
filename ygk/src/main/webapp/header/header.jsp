<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'Yeongdo-Rg';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/Yeongdo-Rg.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

ul li {
	list-style: none;
	float: left;
	margin-left: 10px;
}

a {
  text-decoration: none;
  color:black;
}

.title {
font-family:"Yeongdo-Rg";

}
</style>
</head>

<body>
	<nav>
		<div>
			<ul>
				<li><a class="title" href="main.jsp">요키콕</a></li>
				<li><a>회원</a></li>
				<li><a href="../login/login.jsp">로그인/로그아웃</a></li>
				<li><a href="../board/feedAdd.jsp">게시물 작성</a></li>
				<li><a href="../mypage/mypage.jsp">내 정보</a></li>
				<li><a>소식 확인</a></li>
				<!-- <li><a>위치 갱신</a></li> -->
			</ul>
		</div>
	</nav>

</body>
</html>