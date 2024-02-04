<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/joinSuccess.css">
</head>
<body>
	<div id="join_success_wrap">
		<div id="join_success_box">
			<div id="join_success_text">
				<p>온리원 회원이 되신 것을 환영합니다!</p>
				<p>모든 회원 가입절차가 완료되었습니다.</p>
				<p>로그인 후 모든 서비스를 안전하게 이용할 수 있습니다.</p>
			</div>
			<div id="join_success_buttonBox">
				<button id="join_success_btnLogin" onclick="redirectToLoginPage()">로그인</button>
                <button id="join_success_btnMain" onclick="redirectToMainPage()">메인</button>
			</div>
		</div>
	</div>
	<script>
        function redirectToLoginPage() {
            window.location.href = "meInsertForm.jsp";
        }

        function redirectToMainPage() {
            window.location.href = "../common/main.jsp";
        }
    </script>
</body>
</html>
