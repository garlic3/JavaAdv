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

body {
	font-size:10px;


}

ul li {
	list-style: none;
	margin-top: 10px;
	font-size:10px;
	
}

a {
  text-decoration: none;
  color:black;
}

.title {
font-family:"Yeongdo-Rg";
margin-left:110px;
font-size:20px;

}

.container{
margin-top:50px;
width: 280px;
height:100%;
positon: absoulte;
}

.photo {
width: 80px;
height: 80px;
background-color: #E5E5E5;
border-radius: 50%;
position: relative;
top:30px;
margin:auto;
}




nav {

margin-left:70px;
margin-top:100px;


}

.user {
position: relative;
top:60px;
margin-left:110px;

}


#login {
margin-top: 30px;

}



</style>
</head>
<body>
<script src="https://kit.fontawesome.com/b106feec3e.js" crossorigin="anonymous"></script>
<div class="container">

<span class="title">shather</span>
<div class="photo"></div>
<div class="user">userID</div>
<div class="user">username</div>


<nav>
<ul>
<li id = "home"><i class="fa-solid fa-house"></i>&nbsp&nbsp<a href="#">홈</a></li>
<li id = "profile"><i class="fa-solid fa-user"></i>&nbsp&nbsp<a href="#">프로필</a></li>
<li id = "feeds"><i class="fa-solid fa-socks"></i>&nbsp&nbsp<a href="#">게시물</a></li>
<li id = "alarm"><i class="fa-solid fa-heart"></i>&nbsp&nbsp<a href="#">알림</a></li>
<li id = "saved"><i class="fa-solid fa-bookmark"></i>&nbsp&nbsp<a href="#">저장</a></li>
<li id = "message"><i class="fa-solid fa-message"></i>&nbsp&nbsp<a href="#">메세지</a></li>

<!-- 쿠키 존재할 경우 로그아웃으로 표시 및 연결 -->
<li id = "login"><i class="fa-solid fa-arrow-right-to-bracket"></i>&nbsp&nbsp<a href="#">로그인/아웃</a></li>
</ul>
</nav>
</div>
</body>
</html>