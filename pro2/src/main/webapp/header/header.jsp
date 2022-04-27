<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* @font-face {
    font-family: 'WandohopeB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/WandohopeB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} */
body {
	font-family: 'WandohopeB';
	padding-bottom: 70px;
}

ul {

display:inline-block;
}


</style>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">요기콕(아이콘)</a>
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            회원
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="./login/login.jsp">로그인/로그아웃</a></li>
            <li><a class="dropdown-item" href="#">내 정보</a></li>
          </ul>
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="newscheck.jsp">소식 확인</a>
        </li>
        
        
        <li class="nav-item">
        
          <a class="nav-link active" aria-current="page" href="getlocation.jsp">위치 갱신</a>
        </li>
  </ul>
          
    </div>
</nav>