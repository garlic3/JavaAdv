<%@page import="jdbc.*"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 request.setCharacterEncoding("UTF-8");

 UserDAO dao2 = new UserDAO();

 Cookie[] cookies = request.getCookies();
 for (int i = 0;  i < cookies.length; i++){
 	String name = cookies[i].getName();
 	String value = cookies[i].getValue();
 	
 	int result = dao2.idCheck(value);
 	if(result == 0){
		response.sendRedirect("./main.jsp");
 		out.print("<script>alert('로그인 후 사용해주세요');</script>");
 		
 	}
 }

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<%String la = request.getParameter("lat");
  String lo = request.getParameter("lon");%>
 </head>

<body>

<script type ="text/javascript">
	var con = 0;
	
	function checkForm() {
		
		var con = 0;
    	var img = document.add.uimage.value;
		
		if (document.add.ucon.value.length > 5){
			alert('게시물 내용은 300자이상 입력하실수 없습니다.');
			con = 1;
			document.loginForm.id.select();
		} else if(document.add.uimage.value == '' && document.add.ucon.value == '') {
	    	alert('게시물 내용 또는 사진을 넣으세요');
	    	con = 1;
	    } else if(img != null && img != ''){
	    	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	    	if(!img.match(fileForm)) {
	        	alert("이미지 파일만 업로드 가능");
				con = 1;
	    	}
		}
		
		if(con == 1){
			history.back()
			document.add.ucon.select();
			document.add.uimage.select();
			return false;

		}
		
	}

</script>

<form name="add" action="board_add_db.jsp" method = "post" enctype="multipart/form-data">
<table align=center>
<tr><td colspan=2 align=center height=40><b>게시물 작성</b></td></tr>
<tr><td align=right>글작성</td>
<td><textarea name = "ucon" rows=3 cols=20></textarea></td></tr>
<tr><td align=right>이미지</td>
<td><input type="file" name="uimage"></td></tr>
<tr><td align=right>동영상</td>
<td><input type="file" name="uvideo"></td></tr>
<tr><td><input type="hidden" name="lat" value=<%=la %>></td></tr>
<tr><td><input type="hidden" name="lon" value=<%=la %>></td></tr>
<tr><td colspan=2 align=center height=40><input type="button" onclick="checkForm()" value="게시물 등록"></td></tr>
</table>
</form>

<div align=center><div id="map" style="width:500px;height:400px;"></div></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b5c80defd10abe722587119ff2969f5"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(<%=la%>, <%=lo%>),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(<%=la%>, <%=lo%>); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
</script>



</body>
</html>