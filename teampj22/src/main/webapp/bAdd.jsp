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
<form action = "feedAdd.jsp" method = "post" enctype="multipart/form-data">
<table align=center>
<tr><td colspan=2 align=center height=40><b>톡작성</b></td></tr>
<tr><td align=right>유저 아이디</td>
<td><input type="text" name="uid" placeholder="글작성자 아이디" required></td></tr>
<tr><td align=right>글작성</td>
<td><textarea name = "ucon" rows=3 cols=20></textarea></td></tr>
<tr><td align=right>이미지</td>
<td><input type="file" name="uimage"></td></tr>
<tr><td align=right>동영상</td>
<td><input type="file" name="uvideo"></td></tr>
<tr><td><input type="text" name="lat" value=<%=la %> /></td></tr>
<tr><td><input type="text" name="lon" value=<%=lo %> /></td></tr>
<tr><td align=center></td>
<tr><td colspan=2 align=center height=40><input type="submit" value="등록"></td>
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