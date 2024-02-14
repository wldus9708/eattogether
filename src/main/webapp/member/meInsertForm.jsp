<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/eattogether/css/meInsertForm.css">	
<script type="text/javascript">
	
	function isId(asValue) { //아이디 첫글자는 이메일 형식으로 전환
		var regExp = /^(?=.{1,30}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		return regExp.test(asValue);
	}
	function isBirth(asValue) { //생일 yyyy/mm/dd 형식
		var regExp = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;

		return regExp.test(asValue);
	}
	function isPassword(asValue) {//비밀번호 첫글자는 영문 소문자, 6~8자리 특수문자 포함
		var regExp = /^[a-z](?=.*[!@#$%^&*()_+,-./:;<=>?@[\\\]^_`{|}~])[a-z0-9!@#$%^&*()_+,-./:;<=>?@[\\\]^_`{|}~]{5,7}$/;
					
		return regExp.test(asValue);
	}
	function isName(asValue) { //이름 한글로 2자리 이상 8자리 이하
		var regExp = /^[가-힣]{2,8}$/;

		return regExp.test(asValue);
	}
	function isAlias(asValue) { //닉네임 영어, 숫자, 한글이 2자 이상 8자 이하
		var regExp = /^[a-zA-Z0-9가-힣]{2,8}$/;

		return regExp.test(asValue);
	}
	function isPhone(asValue) { // 앞에 3자리 010,011,016,017,019 뒤에는 7자리또는 8자리 
		var regExp = /^(010|011|016|017|019)\d{7,8}$/;

		return regExp.test(asValue);
	}
	function resetIdCheckValue() {
        $('#join_idCheck').val("N");
    }
	function resetPhoneCheckValue() {
        $('#join_phoneCheck').val("N");
    }
	
	$(document).ready(function() {
		$('#join_birth').datepicker({ // 제이쿼리 생일
			dateFormat : "yy/mm/dd"
		});
		$('#join_DuplicateBtn').click(function(){
		 	var id = $("#join_id").val();
	    	window.open("/eattogether/member/checkUserid.jsp?id="+id,"idchk",
	   	"width=400,height=300, location=yes,resizable=yes,top=100,left=50");
	 	});
		$('#join_DuplicateBtn2').click(function(){
		 	var phone = $("#join_phone").val();
	    	window.open("/eattogether/member/checkPhone.jsp?phone="+phone,"phonechk",
	   	"width=400,height=300, location=yes,resizable=yes,top=100,left=50");
	 	});
		$('#join_DuplicateBtn3').click(function(){
		 	var alias = $("#join_alias").val();
	    	window.open("/eattogether/member/checkAlias.jsp?alias="+alias,"aliaschk",
	   	"width=400,height=300, location=yes,resizable=yes,top=100,left=50");
	 	});
		$('form[name=joinForm] #join_id').on('input', function() { // 아이디 입력란에서 값이 변경될 때마다 아이디 체크 값을 초기화
			resetIdCheckValue();
        });
		$('form[name=joinForm] #join_phone').on('input', function() { // 전화번호 입력란에서 값이 변경될 때마다 전화번호 체크 값을 초기화
            resetPhoneCheckValue();
        });
		
		
		$('form[name=joinForm] #join_id').keyup(function() { // 아이디 제약조건 keyup
			if (!isId($('form[name=joinForm] #join_id').val())) {
				$('form[name=joinForm] #join_idError').text("이메일형식으로 입력해주세요").css("color", "red");
			} else {
				$('form[name=joinForm] #join_idError').text("");
			}
		})
		$('form[name=joinForm] #join_birth').keyup(function() { // 생일 제약조건 keyup
			if (!isBirth($('form[name=joinForm] #join_birth').val())) {
				$('form[name=joinForm] #join_birthError').text("yyyy/mm/dd 형식으로 입력해 주세요.").css("color", "red");
			} else {
				$('form[name=joinForm] #join_birthError').text("");
			}
		})
		$('form[name=joinForm] #join_birth').change(function() { // 생일 제약조건 change(datepicker로 선택했을때를 위해 넣음)
			if (!isBirth($('form[name=joinForm] #join_birth').val())) {
				$('form[name=joinForm] #join_birthError').text("yyyy/mm/dd 형식으로 입력해 주세요.").css("color", "red");
			} else {
				$('form[name=joinForm] #join_birthError').text("");
			}
		})
		$('form[name=joinForm] #join_password').keyup(function() {// 비밀번호 제약조건 keyup
			if (!isPassword($('form[name=joinForm] #join_password').val())) {
				$('form[name=joinForm] #join_passwordError').text("첫글자는 영문 소문자, 6~8자리 특수문자 포함해주세요").css("color", "red");
			} else {
				$('form[name=joinForm] #join_passwordError').text("");
			}
		})
		$('form[name=joinForm] #join_name').keyup(function() {
			if (!isName($('form[name=joinForm] #join_name').val())) {// 이름 제약조건 keyup
				$('form[name=joinForm] #join_nameError').text("한글로 2~8자리로 입력해주세요").css("color", "red");
			} else {
				$('form[name=joinForm] #join_nameError').text("");
			}
		})
		$('form[name=joinForm] #join_alias').keyup(function() {// 닉네임 제약조건 keyup
			if (!isAlias($('form[name=joinForm] #join_alias').val())) {
					$('form[name=joinForm] #join_aliasError').text("영어, 숫자, 한글이 2자 이상 8자 이하 입력해주세요").css("color", "red");
				} else {
					$('form[name=joinForm] #join_aliasError').text("");
				}
			})
		$('form[name=joinForm] #join_phone').keyup(function() {// 핸드폰 번호 제약조건 keyup
			if (!isPhone($('form[name=joinForm] #join_phone').val())) {
				$('form[name=joinForm] #join_phoneError').text("010,011,016,017,019포함 10~11자리입력해주세요").css("color", "red");
			} else {
				$('form[name=joinForm] #join_phoneError').text("");
			}
		})
	});
	
	
	
	function validCheck() { // 제약조건 alert창 안내 
		var id = $('#join_id').val();
		if (!isId(id)) {
			alert('아이디는 이메일 형식으로 입력해주세요.');
			$('#join_id').focus();
			return false;
		}
		var idCheckValue = $('#join_idCheck').val();
	    if (idCheckValue === "N") {
	        alert('아이디 중복 확인을 해주세요.');
	        return false;
	    }
		
		var password = $('#join_password').val();
		if (!isPassword(password)) {
			alert('비밀번호 첫글자는 영문 소문자, 6~8자리 특수문자 포함으로 입력해주세요');
			$('#join_alias').focus();
			return false;
		}
		
		var name = $('#join_name').val();
		if (!isName(name)) {
			alert('이름은 한글로 2자리 이상 8자리 이하로 입력해주세요');
			$('#join_name').focus();
			return false;
		}
		var alias = $('#join_alias').val();
		if (!isAlias(alias)) {
			alert('닉네임은 닉네임 영어, 숫자, 한글이 2자 이상 8자 이하로 입력해주세요');
			$('#join_alias').focus();
			return false;
		}
		var phoneCheckValue = $('#join_phoneCheck').val();
	    if (phoneCheckValue === "N") {
	        alert('전화번호 중복 확인을 해주세요.');
	        return false;
	    }
		
		var birth = $('#join_birth').val();
		if (birth.length < 1) {
			alert('생일을 입력해주세요.');
			$('#join_birth').focus();
			return false;
		} else if (!isBirth(birth)) {
			alert('생일은 yyyy/mm/dd 형식으로 입력해주세요');
			$('#join_birth').focus();
			return false;
		}
		var phone = $('#join_phone').val();
		if (phone.length < 1) {
			alert('전화번호를 입력해주세요');
			$('#join_phone').focus();
			return false;
		} else if (!isPhone(phone)) {
			alert('앞에 3자리 010,011,016,017,019,"-"없이 뒤에는 7자리또는 8자리  입력해주세요');
			$('#join_phone').focus();
			return false;
		}
		var phoneCheckValue = $('#join_phoneCheck').val();
	    if (phoneCheckValue === "N") {
	        alert('전화번호 중복 확인을 해주세요.');
	        return false;
	    }
		// 체크박스 하나는 선택되게 alert
	    var checkedBoxes = $('input[name="taste"]:checked');
	    if (checkedBoxes.length === 0) {
	        alert('좋아하는 음식을 하나 이상 선택해주세요.');
	        return false;
	    }

	}
	
</script>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<div id="join_wrap">
		<div id="join_box">
			<form action="<%=withFormTag %>" method="post" name="joinForm">
				<input type="hidden" name="command" value="meInsert">
				<div id="join_form_wrap">
					<div class="join_form_container">
						<label class="join_label" for="userid">아이디:</label> <input
							class="join_input_field" type="text" id="join_id" name="id" maxlength="30" onkeydown="inputIdChk()">
							<input
							type="hidden" id="join_idCheck" name="join_idCheck" value="N">
						<button type="button" id="join_DuplicateBtn">중복확인</button>
						<span id="join_idError" class="join_error_next_box"></span>
					</div>
					<div class="join_form_container">
						<label class="join_label" for="password">비밀번호:</label> <input
							class="join_input_field" type="password" id="join_password"
							name="password" maxlength="8"> <span id="join_passwordError"
							class="join_error_next_box"></span>
					</div>
					
					<div class="join_form_container">
						<label class="join_label" for="username">이름:</label> <input
							class="join_input_field" type="text" id="join_name"
							name="name" maxlength="8"> <span id="join_nameError"
							class="join_error_next_box"></span>
					</div>
					<div class="join_form_container">
						<label class="join_label" for="alias">닉네임:</label> <input
							class="join_input_field" type="text" id="join_alias"
							name="alias" maxlength="8" onkeydown="inputAliasChk()"> <input type="hidden" id="join_aliasCheck"
							name="join_aliasCheck" value="N">
						<button type="button" id="join_DuplicateBtn3">중복확인</button> <span id="join_aliasError"
							class="join_error_next_box"></span>
					</div>
					
					<div class="join_form_container">
						<label class="join_label" for="birth">생일:</label> <input
							class="join_input_field" type="text" id="join_birth"
							name="birth" maxlength="10"> <span id="join_birthError"
							class="join_error_next_box"></span>
					</div>
					<div class="join_form_container">
						<label class="join_label" for="phone">전화번호:</label> <input
							class="join_input_field" type="tel" id="join_phone" name="phone"
							maxlength="11" onkeydown="inputPhoneChk()"> <input type="hidden" id="join_phoneCheck"
							name="join_phoneCheck" value="N">
						<button type="button" id="join_DuplicateBtn2">중복확인</button>
						<span id="join_phoneError" class="join_error_next_box"></span>
					</div>
					<div class="join_form_container">
						<label class="join_label" for="favorite_food">좋아하는 음식:</label>
						<div class="join_food_opt_container">
							<label class="join_food_opt_label" for="join_favorite_food1">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food1" name="taste" value="한식">
								한식
							</label> <label class="join_food_opt_label" for="join_favorite_food2">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food2" name="taste" value="일식">
								일식
							</label> <label class="join_food_opt_label" for="join_favorite_food3">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food3" name="taste" value="양식">
								양식
							</label> <label class="join_food_opt_label" for="join_favorite_food4">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food4" name="taste" value="중식">
								중식
							</label>
						</div>
						<span id="join_favoriteFoodError" class="join_error_next_box"></span>
					</div>
					<div class="join_button_container">
						<button type="submit" class="join_submit_button"
							onclick="return validCheck();">가입하기</button>
						<button type="reset" class="join_submit_button">초기화</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
</html>