<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/company.css">
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div id="company_wrap">
		<div id="company_title">
			<p>찾아오시는 길</p>
		</div>
		<div id="company_map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23b16cbcbf1e110866397960059fe575&libraries=services,clusterer,drawing"></script>
		<script>
			var container = document.getElementById('company_map'); //지도를 표시할 div
			var options = {
				center : new kakao.maps.LatLng(37.552429, 126.937997), // 지도의 좌표
				level : 2
			//지도의 확대 레벨
			};

			var map = new kakao.maps.Map(container, options); //지도 생성하기

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(37.552429, 126.937997);

			var marker = new kakao.maps.Marker({ //지도 마커 생성하기
				position : markerPosition
			});
			marker.setMap(map);// 마커가 지도 위에 표시되게하기

			var iwContent = '<div style="padding:5px; width: 172px; font-size:17px; font-weight:bold;">(주)오늘 뭐먹지 본사 <br><a href="https://map.kakao.com/link/map/(주)오늘 뭐먹지 본사,37.552429, 126.937997" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/(주)오늘 뭐먹지 본사,37.552429, 126.937997" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(37.552429, 126.937997); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		</script>
		<div id="company_content">
			<p>회사주소 : 서울특별시 마포구 백범로 23, 3층 302호 (신수동, 케이터틀)</p>
			<p>2호선 : 신촌역 6번출구 서강대 방향으로 3분거리 [스타벅스건물3층]</p>
			<p>경의중앙선 : 서강대역 1번출구 서강대 방향으로 3분거리 [스타벅스건물3층]</p>
		</div>
	</div>

</body>
</html>
