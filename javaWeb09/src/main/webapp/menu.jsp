<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-success">
	<div class="container-fluid">
		<a class="navbar-brand text-light
			" href="#">๐ถ&nbspํ์ ๊ด๋ฆฌ ํ๋ก๊ทธ๋จ</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="univ_table_list.jsp">ํ์ ๋ชฉ๋ก</a></li>
				<li class="nav-item"><a class="nav-link" href="univ_table_input_form.jsp">ํ์ ๋ฑ๋ก</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						ํ์๊ด๋ฆฌ </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="univ_db_std_form.jsp">๋ก๊ทธ์ธ</a></li>
						<li><a class="dropdown-item" href="univ_db_logout.jsp">๋ก๊ทธ์์</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">ํ์๊ฐ์</a></li>
						<li><a class="dropdown-item" href="#">๊ด๋ฆฌ์</a></li>
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
