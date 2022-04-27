<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>
<%@page import="util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목 아님</title>

</head>
<body>

<!-- 지도 스타일 -->
<style>
.centered_map { 
	margin: 0 auto;            /* 중앙배치  */
	border: 1px solid black;   /* 지도 모서리 선  */
}
</style>

<%
// 받아온 현재 위치 경도,위도를 자바의 변수로 저장
String lan_now = request.getParameter("ulan");
String lon_now = request.getParameter("ulon");

// 거리 계산을 위한 double 형변환
double lan_d = Double.parseDouble(lan_now);
double lon_d = Double.parseDouble(lon_now);
%>


<!-- body안의 div(지도출력) --> 
<div class="centered_map" id="map" style="width: 80%; height: 350px;"></div>

<!-- 카카오api -->
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=524d840e60a5b519f048cc6e69baa8ad"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.4508, 126.570657), // 지도의 중심좌표(디폴트-카카오센터))
			level : 5    // 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//////////////////////////////////////////////////////////////////////////////// 현재위치		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 현재위도
				lon = position.coords.longitude; // 현재경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">나 여기있어!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

////////////////////////////////////////////////////////////////////////////////// 다충 출력
				// DB에서 위도 경도를 찾기 위해 DTA를 사용합니다.
				<%String sql  = "SELECT * FROM test WHERE (lan BETWEEN "+(lan_d-0.006)+" AND "+(lan_d+0.006) +") AND (lon BETWEEN "+ (lon_d-0.006) + " AND "+(lon_d+0.006)+");";
				ArrayList<smallDTO> feeds  = (new smallDAO()).getList(sql);
				for(smallDTO feed : feeds) {%>

					var markerPosition = new kakao.maps.LatLng(<%=feed.getLan()%>, <%=feed.getLon()%>);
				
					// 거리 계산을 위한 클래스
					<%DistanceCheck check = new DistanceCheck();%>
				
// **					// 만약 거리(현재위도,현제경도, 받은위도,받은경도)가 500미터 이하일경우 (아직 안됨)
					<%-- if(<%=check.distance(lan_d,lon_d,feed.getLan(),feed.getLon(),"kilometer")%> < 0.5){ --%>
						// 마커 생성하여
						var marker = new kakao.maps.Marker({
							position : markerPosition
						});

						
						<%String str = "\"<div>" + feed.getContent() + "</div>\"";%>
						// 마우스 오버 이벤트
						var infowindow = new kakao.maps.InfoWindow({
					        content: <%=str%> // 인포윈도우에 표시할 내용
					    });
												
						kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

					    // 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
				// for 닫는 곳
				<% } %>
////////////////////////////////////////////////////////////////////////////////////  
				// 지도에 표시할 원을 생성합니다
				var circle = new kakao.maps.Circle({
				    center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
				    radius: 500, // 미터 단위의 원의 반지름입니다 
				    strokeWeight: 5, // 선의 두께입니다 
				    strokeColor: '#75B8FA', // 선의 색깔입니다
				    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				    strokeStyle: 'dashed', // 선의 스타일 입니다
				    fillColor: '#CFE7FF', // 채우기 색깔입니다
				    fillOpacity: 0.7  // 채우기 불투명도 입니다   
				}); 

				// 지도에 원을 표시합니다 
				circle.setMap(map); 
//////////////////////////////////////////////////////////////////////////////////////
	


			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			message = '현재위치를 사용할수 없어요..'
			alert(message) /* 이거 다시 확인할것. 안뜸  */
		}
		
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}


		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
	</script>

</body>
</html>