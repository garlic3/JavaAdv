<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-success">
	<div class="container-fluid">
		<a class="navbar-brand text-light
			" href="#">🐶&nbsp학생 관리 프로그램</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="univ_table_list.jsp">학생 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="univ_table_input_form.jsp">학생 등록</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						회원관리 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="univ_db_std_form.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="univ_db_logout.jsp">로그아웃</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">회원가입</a></li>
						<li><a class="dropdown-item" href="#">관리자</a></li>
					</ul></li>
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>
