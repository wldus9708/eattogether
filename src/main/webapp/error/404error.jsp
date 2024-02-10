<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/404error.css">
</head>
<body>
	<div id="error_wrap">
		<div id="error_box">
			<div id="error_text">
				<p>404</p>
				<p>죄송합니다. 현재 찾을 수 없는 페이지를 요청하셨습니다.</p>
				<p>페이지의 주소가 잘못 입력되었거나,</p>
				<p>주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
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

