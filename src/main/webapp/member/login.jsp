<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/login.css">


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Modal -->
	<div id="login_modal_wrap">
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디
							찾기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						이름 : <input type="text" maxlength="8"><br> 
						전화번호 : <input type="text" maxlength="11">
						<button type="button" class="btn btn-secondary login_checkbtn">아이디 찾기</button>
						<br> <span>아이디는 ~~~입니다.</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div id="login_modal_wrap2">
		<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호
							찾기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						아이디 : <input type="text" maxlength="8"><br> 
						전화번호 : <input type="text" maxlength="11">
						<button type="button" class="btn btn-secondary login_checkbtn">비밀번호 찾기</button>
						<br> <span>비밀번호는 ~~~입니다.</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="login_wrap">
		<div class="login_container">
			<div class="login_left-half">
				<div id="login_box1">
					<div id="login_box1_text">
						<p>오늘 뭐먹지?</p>
						<p>오늘 당신의 하루를</p>
						<p>특별하게 만들어드립니다.</p>
					</div>
				</div>
			</div>
			<form name="login_form" method="post" action="">
				<div class="login_right-half">
					<div id="login_box2">
						<div id="login_text">
							<p>로그인</p>
						</div>
						<div id="login_idbox1">
							<div id="login_idbox_label">
								<label for="username">아이디 : </label>
							</div>
							<div id="login_idbox_input">
								<input type="text" id="login_userid" name="userid" maxlength="8">
							</div>
						</div>
						<span class="login_hiddenbox"></span>
						<div id="login_idbox2">
							<div id="login_idbox_label">
								<label for="password">비밀번호 : </label>
							</div>
							<div id="login_idbox_input">
								<input type="text" id="login_password" name="password" maxlength="8">
							</div>
						</div>
						<span class="login_hiddenbox"></span>
						<div id="login_buttonbox">
							<button id="login_button" type="submit">로그인</button>
						</div>

						<div id="login_links">
							<a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">아이디 찾기</a> 
							<a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">비밀번호 찾기</a> <a
								href="<%=notWithFormTag%>meAgree">회원가입</a>
						</div>

						<hr id="login_hr">
						<div class="login_images">
							<a class="login_image" href="#"> <img
								src="/eattogether/image/google.png" alt="구글 로그인"></a> <a
								class="login_image" href="#"> <img
								src="/eattogether/image/kakao.png" alt="카카오 로그인"></a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
	    $('form[name=login_form] #login_userid').keyup(function() {
	        if ($('form[name=login_form] #login_userid').val().length < 1) {
	            $('form[name=login_form] .login_hiddenbox').eq(0)
	                .text("아이디를 입력해주세요")
	                .css("color", "red");
	        } else {
	            $('form[name=login_form] .login_hiddenbox').text("");
	        }
	    });
	
	    $('form[name=login_form] #login_password').keyup(function() {
	        if ($('form[name=login_form] #login_password').val().length < 1) {
	            $('form[name=login_form] .login_hiddenbox').eq(1)
	                .text("비밀번호를 입력해주세요")
	                .css("color", "red");
	        } else {
	            $('form[name=login_form] .login_hiddenbox').text("");
	        }
	    });
	});
</script>
</html>
<%@ include file="./../common/footer.jsp"%>