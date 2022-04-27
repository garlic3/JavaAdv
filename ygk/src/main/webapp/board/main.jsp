<%@page import="jdbc.*"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단톡방</title>
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

<form name="add" action="feedAdd.jsp" method = "post" enctype="multipart/form-data">
<table align=center>
<tr><td colspan=2 align=center height=40><b>톡작성</b></td></tr>
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


<table align=center>
<tr><td colspan=2>톡보기</td></tr>

<% 

ArrayList<FeedDTO> feeds = (new FeedDAO()).getList();
for (FeedDTO feed : feeds) {
	String img = feed.getImages();
	String imgstr = "";
	String vid = feed.getVideos();
	
 	if (img != null) {
 		imgstr = "<img src='images/" + img + "' width = 240>";
 	} 
 	
 	
%>
	<tr><td colspan=2><hr></td></tr>
	<tr><td><%=feed.getId() %></td><td><%=feed.getTs() %></td></tr>
	<tr><td colspan=2><%=imgstr %></td></tr>
	<tr><td colspan=2><%=feed.getContent() %></td></tr>
	<tr><td>위도:<%=feed.getLatitude() %></td></tr>
	<tr><td>경도:<%=feed.getLongitude() %></td></tr>

<%     
}
%>

</table>
</body>
</html>