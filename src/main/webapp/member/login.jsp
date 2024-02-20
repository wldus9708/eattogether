<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<%
String chek = null;
String id = "";
Cookie[] cookie = request.getCookies();
if (cookie != null) {
	for (int i = 0; i < cookie.length; i++) {
		if (cookie[i].getName().equals("checkbox")) {
	chek = "checked";
	id = cookie[i].getValue();
	System.out.println(id);
		}
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/login.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<form name="login_form" method="post" action="<%=withFormTag%>">
			<input type="hidden" name="command" value="meLogin">
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
								<input type="text" id="login_userid" name="id" maxlength="30" value="<%=id%>">
							</div>
						</div>
						<span class="login_hiddenbox"></span>
						<div id="login_idbox2">
							<div id="login_idbox_label">
								<label for="password">비밀번호 : </label>
							</div>
							<div id="login_idbox_input">
								<input type="password" id="login_password" name="password" maxlength="8">
							</div>
						</div>
						<span class="login_hiddenbox"></span>
						<div id="login_buttonbox">
							<button id="login_button" type="submit">로그인</button>
						</div>
						<div id="login_checkbox">
							<input name="checkbox" type=checkbox value="chk" <%= chek %>> 아이디 저장		
						</div>

						<div id="login_links">
							<button type="button" id="login_findId">아이디 찾기</button> 
							<button type="button" id="login_findPwd">비밀번호 찾기</button> &nbsp;&nbsp;&nbsp;&nbsp;
							<a href="<%=notWithFormTag%>meAgree">회원가입</a>
						</div>

						<hr id="login_hr">
						<div class="login_images">
						<!-- 로컬호스트용 -->
							<a class="login_image" href="https://kauth.kakao.com/oauth/authorize?client_id=5975a25df2fa8cac4ce9ba8863d45540&redirect_uri=http://localhost:8090<%=notWithFormTag%>meKakaoLogin&response_type=code"> <img
								src="/eattogether/image/kakao_login_large_wide.png" alt="카카오 로그인"></a>
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
	    $('#login_findId').click(function(){
	        window.open("/eattogether/member/findUserid.jsp", "findid", "width=450,height=300,location=yes,resizable=no,top=100,left=50");
	    });
	    $('#login_findPwd').click(function(){
	        window.open("/eattogether/member/findPassword.jsp", "findpwd", "width=450,height=300,location=yes,resizable=no,top=100,left=50");
	    });
	    
	});
</script>
</html>
<%@include file="./../common/mangerfooter.jsp"%>