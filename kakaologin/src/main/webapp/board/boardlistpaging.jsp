<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<%@ include file="/_header.jsp"%>

	<!-- 표현문 -->
	<%!String title = "게시판";%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/emall";
	String id = "root";
	String pw = "SQLA1$kjg724";
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rset=null;
	
	conn = DriverManager.getConnection(url, id, pw);
	
	String sql = "SELECT count(*) FROM board"; // 개수 가져오기
	pstmt = conn.prepareStatement(sql);
	rset = pstmt.executeQuery();
/////////////////////페이징////////////////////////////////////////
	// 필요한 변수들 선언
	int LINE_PER_PAGE = 5; // 페이지당 출력 줄수
	int PAGE_PER_BLOCK = 2; // 블럭당 페이지 수
	
	int nbr_of_row = 0; // 게시물의 총수
	int nbr_of_page = 0; // 총 페이지 수

	int start_pointer = 0; // DB 검색 시작 위치
	int cur_page_no = 0; // 현재 페이지 번호
	int block_nbr = 0; // 블럭 번호
	int block_start_page_no = 0; // 블럭 시작 페이지 번호
	int block_endpage_no = 0; // 블럭 끝 페이지 번호
	int previous_block_start_pageno = 0; // 이전 블럭 시작 페이지 번호
	int next_block_start_pageno = 0; // 다음 블럭 시작 페이지 번호
	
	// 총 게시물 개수 (총 회원의 수, 테이블 전체의 수) 계산
	rset.next();
	nbr_of_row = Integer.parseInt(rset.getString("count(*)"));
	
	// 총 페이지 수 계산 (ceil:올림/floor:버림/round:반올림)
	nbr_of_page = (int)Math.ceil((float)nbr_of_row/LINE_PER_PAGE);
	
	// 검색 페이지 확인
	if(request.getParameter("pageno")==null){
		// 맨처음 검색 
		cur_page_no = 1;
	}else if(nbr_of_page<Integer.parseInt(request.getParameter("pageno"))){
		// db검색 시작 위치 계산
		cur_page_no = nbr_of_page;
	}else{
		// 특정 페이지 검색
		cur_page_no = Integer.parseInt(request.getParameter("pageno"));
	}
	
	// db 검색 시작 위치와 개수
	start_pointer = (cur_page_no - 1) * LINE_PER_PAGE;
	
	//***************************SQL 처리******************************//
	sql = "SELECT * FROM board ORDER BY bid ASC LIMIT ?,?";
	pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start_pointer);
		pstmt.setInt(2, LINE_PER_PAGE);
	rset = pstmt.executeQuery();
	
	if(!rset.isBeforeFirst()){
		out.print("<script>alert('데이터가 없습니다.');"
		+"history.back();"
		+"</script>");
	}
	//**************************************************************//
//////////////////////////////////////////////////////////////////////	
	int no=1;
	while (rset.next()) {
		String bid = rset.getString("bid");
		String bcontents = rset.getString("bcontents");
		String buser = rset.getString("buser");
		String btitle = rset.getString("btitle");
		String bts = rset.getString("bts");		
	%>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th scope="row"><%=bid%></th>
				<td><%=btitle%></td>
				<td><%=buser%></td>
				<td><%=bts%></td>
			</tr>
		</tbody>
	</table>
	<%
	}
	%>
	<tr>
	<td colspan=4>
	<%
////////////////////////페이지 제어////////////////////////
	// 블럭 번호
	block_nbr = ((cur_page_no -1) / PAGE_PER_BLOCK) + 1;

	// 블럭 시작 페이지 번호
	block_start_page_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;
	
	// 블럭 끝 페이지 번호
	block_endpage_no = (block_start_page_no + PAGE_PER_BLOCK) - 1;
	
	if(block_nbr > 1){
		out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=1'>" + "맨처음</a>]&nbsp");

		// 이전 블럭 시작 페이지
		previous_block_start_pageno = block_start_page_no - PAGE_PER_BLOCK;
		out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + previous_block_start_pageno + "'>이전</a>]&nbsp");
	}
	
	for(int pgn = block_start_page_no; pgn <= block_endpage_no; pgn++){
		if(pgn > nbr_of_page){
			break;
		}
		if(pgn == cur_page_no){
			out.print("&nbsp" + pgn + "$nbsp");
		}else{
			out.print("&nbsp[" + "<a href='boardlistpaging.jsp?" + "pageno=" + pgn + "'>" + pgn +"</a>]&nbsp");
		}
	}
	
	if(block_endpage_no < nbr_of_page){
		//다음 블럭 시작 페이지
		next_block_start_pageno = block_endpage_no + 1;
		out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + next_block_start_pageno + "'>다음</a>]&nbsp");
		
		out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + nbr_of_page + "'>" + "맨끝</a>]&nbsp");
	}
////////////////////////////////////////////////////////////
	%>
	</td>
	</tr>
	
	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>