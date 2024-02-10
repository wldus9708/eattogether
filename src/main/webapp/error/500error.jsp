<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/500error.css">
</head>
<body>
	<div id="error_wrap">
		<div id="error_box">
			<div id="error_text">
				<p>500</p>
				<p>죄송합니다. 서버 내부 오류로 인해 웹 서버가 요청 사항을 수행 할 수 없습니다.</p>
				<p>저희 오늘 뭐먹지? 에서 빠른 시간 안에 복구하도록 하겠습니다.</p>
				<p>곧 정상화가 될 예정이니 잠시 후 다시 이용 부탁드리며 이용에 불편을 드려 사과드립니다.</p>
			</div>
			<div id="error_buttonBox">
				<button id="error_btnLogin" onclick="redirectToBackPage()">이전</button>
				<button id="error_btnMain" onclick="redirectToMainPage()">메인</button>
			</div>
		</div>
	</div>
	<script>
		function redirectToBackPage() {
			 window.history.back();
		}

		function redirectToMainPage() {
			window.location.href = "/eattogether/common/main.jsp";
		}
	</script>
</body>
</html>

