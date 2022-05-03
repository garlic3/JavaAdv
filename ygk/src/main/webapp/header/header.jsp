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

.container{

width: 1258px;
height: 1020px;: 
}
</style>
</head>
<body>
<div class="container">
<ul>
<li class="title">요기콕</li>
<li><a href="../board/board_add.jsp">글쓰기(아이콘)</a></li>
<li><a href="../mypage/mypage.jsp">나의정보(아이콘)</a></li>

<!-- 쿠키 존재할 경우 로그아웃으로 표시 및 연결 -->
<li><a href="../login/login.jsp">로그인(아이콘)</a></li>
<li><a href="../login/logout.jsp">로그아웃(아이콘)</a></li>
<li>알람</li>
</ul>
</div>
</body>
</html>