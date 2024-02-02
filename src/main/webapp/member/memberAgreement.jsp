<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/mangerheader.jsp"%>		
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/memberAgreement.css">
<script>
	function checkAll() { // 전체동의 버튼 
		var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		var radios_sns = document
				.getElementsByName("memberAgreement_event_SNS");
		var radios_kakao = document
				.getElementsByName("memberAgreement_event_kakao");
		var radios_email = document
				.getElementsByName("memberAgreement_event_email");

		checkboxes.forEach(function(checkbox) {
			checkbox.checked = true;
		});

		// 체크되지 않은 경우에만 "동의합니다"로 체크
		if (!radios_sns[0].checked) {
			radios_sns[0].checked = true;
			radios_sns[1].checked = false;
		}
		if (!radios_kakao[0].checked) {
			radios_kakao[0].checked = true;
			radios_kakao[1].checked = false;
		}
		if (!radios_email[0].checked) {
			radios_email[0].checked = true;
			radios_email[1].checked = false;
		}
	}

	function nextPage() { //다음 페이지로 넘어가기전에 체크박스 확인
		var checkboxes = document.querySelectorAll('input[type="checkbox"]');
		var isAllChecked = true;

		checkboxes.forEach(function(checkbox) {
			if (!checkbox.checked) {
				isAllChecked = false;
			}
		});

		if (isAllChecked) { //전체 체크 됐을때만 페이지 이동
			window.location.href = 'meInsertForm.jsp';
		} else {
			alert('모든 항목에 동의해주세요.');
		}
	}

	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						document.getElementById("memberAgreement_nextButton").onclick = nextPage;
					});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="memberAgreement_wrap">
		<div id="memberAgreement_box">
			<div id="memberAgreement_title">
				<p>이용약관</p>
			</div>
			<div id="memberAgreement_buttonBox">
				<button id="memberAgreement_allButton" onclick="checkAll()">전체
					동의</button>
			</div>
			<div class="memberAgreement_list">
				<div class="memberAgreement_list_text">
					<p>※[필수]</p>
				</div>
				<textarea class="memberAgreement_textarea" rows="7" cols="50"
					readonly>  사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.사이트 이용료는 달 5000원 입니다.</textarea>
				<div class="memberAgreement_check">
					<input type="checkbox">동의 합니다
				</div>
			</div>
			<div class="memberAgreement_list">
				<div class="memberAgreement_list_text">
					<p>※[필수]</p>
				</div>
				<textarea class="memberAgreement_textarea" rows="7" cols="50"
					readonly>  레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.레시피 프리미엄 구독은 달 15000원 입니다.</textarea>
				<div class="memberAgreement_check">
					<input type="checkbox">동의 합니다
				</div>
			</div>


			<div id="memberAgreement_event">
				<div id="memberAgreement_event_title">
					<p>이벤트 안내 방법(선택)</p>
				</div>
				<div class="memberAgreement_event_check">
					<div class="memberAgreement_event_check_left">
						<span>SNS</span>
					</div>
					<div class="memberAgreement_event_check_right">
						<input type="radio" name="memberAgreement_event_SNS" value="Y">동의합니다
						<input type="radio" name="memberAgreement_event_SNS" value="N">동의하지
						않습니다.
					</div>
				</div>
				<div class="memberAgreement_event_check">
					<div class="memberAgreement_event_check_left">
						<span>카카오톡</span>
					</div>
					<div class="memberAgreement_event_check_right">
						<input type="radio" name="memberAgreement_event_kakao" value="Y">동의합니다
						<input type="radio" name="memberAgreement_event_kakao" value="N">동의하지
						않습니다.
					</div>
				</div>
				<div class="memberAgreement_event_check">
					<div class="memberAgreement_event_check_left">
						<span>이메일</span>
					</div>
					<div class="memberAgreement_event_check_right">
						<input type="radio" name="memberAgreement_event_email" value="Y">동의합니다
						<input type="radio" name="memberAgreement_event_email" value="N">동의하지
						않습니다.
					</div>
				</div>

			</div>
			<div id="memberAgreement_nextBox">
				<button id="memberAgreement_nextButton">다음</button>
			</div>
		</div>
	</div>
</body>
</html>