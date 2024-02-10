<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0 auto;
	background: #F8EBCE;
}

#error_box {
	margin: 200px auto;
	width: 1200px;
	height: 600px;
	border-radius: 65px;
	border: 10px solid #000;
	background: #FFF;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#error_text {
	text-align: center;
	
}

#error_text p:nth-child(1) {
	margin: 0;
    padding: 0;
	font-size: 140px;
	font-weight: bold;
	color: #ED6D35;
}

#error_text p:nth-child(2) {
	font-size: 30px;
	font-weight: bold;
}

#error_text p:nth-child(3),#error_text p:nth-child(4) {
	font-size: 20px;
	font-weight: bold;
}

#error_buttonBox {
	text-align: center;
	margin-top: 50px;
}

#error_btnLogin, #error_btnMain {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	background-color: #ED6D35;
	color: white;
	border: none;
	border-radius: 5px;
	border-radius: 15px;
}
</style>
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

