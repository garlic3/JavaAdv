<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>
	
	<%
	
	
	String lat = request.getParameter("lat");
	String lng = request.getParameter("lng");
	
	out.print(lat);
	out.print(lng);
	
	%>
	
	
	
	<div id="map" style="width: 500px; height: 400px;"></div>
	
	

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fa68625aa2330372eff9b0aca380931
"></script>

	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(<%=lat%>, <%=lng%>),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>