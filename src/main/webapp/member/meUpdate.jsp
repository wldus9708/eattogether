<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/mydataupdate2.css">
<script type="text/javascript">

function isPassword(asValue) {//비밀번호 첫글자는 영문 소문자, 6~8자리 특수문자 포함
	var regExp = /^[a-z](?=.*[!@#$%^&*()_+,-./:;<=>?@[\\\]^_`{|}~])[a-z0-9!@#$%^&*()_+,-./:;<=>?@[\\\]^_`{|}~]{5,7}$/;
				
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
		
		var favoriteFood = "${bean.taste}";
		$('#join_DuplicateBtn2').click(function(){
		 	var phone = $("#join_phone").val();
	    	window.open("/eattogether/member/checkPhone.jsp?phone="+phone,"phonechk",
	   	"width=450,height=300, location=yes,resizable=yes,top=100,left=50");
	 	});
		$('#join_DuplicateBtn3').click(function(){
		 	var alias = $("#join_alias").val();
	    	window.open("/eattogether/member/checkAlias.jsp?alias="+alias,"aliaschk",
	   	"width=450,height=300, location=yes,resizable=yes,top=100,left=50");
	 	});
	});
	
	function validCheck() { // 제약조건 alert창 안내 
		
		var alias = $('#join_alias').val();
		if (!isAlias(alias)) {
			alert('닉네임은 닉네임 영어, 숫자, 한글이 2자 이상 8자 이하로 입력해주세요');
			$('#join_alias').focus();
			return false;
		}
	    /* var aliasCheckValue = $('#join_aliasCheck').val();
	    if (aliasCheckValue === "N") {
	        alert('닉네임 중복 확인을 해주세요.');
	        return false;
	    } */
		var password = $('#join_password').val();
		if (!isPassword(password)) {
			alert('비밀번호 첫글자는 영문 소문자, 6~8자리 특수문자 포함으로 입력해주세요');
			$('#join_password').focus();
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
		/* var phoneCheckValue = $('#join_phoneCheck').val();
	    if (phoneCheckValue === "N") {
	        alert('전화번호 중복 확인을 해주세요.');
	        return false;
	    } */

	}
</script>
<style>
</style>
</head>
<body>
	<c:set var="bean" value="${sessionScope.loginfo}"></c:set>
	<div id="updateMypage_entir">

		<div id="myupdate_box00">
			<div class="custom-shape" id="myupdateicon">
				<img src="/eattogether/image/${bean.picture}" id="myupdate_icon">
			</div>

		</div>
		<div id="myupdate_box10">
			<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="command" value="meUpdate">
				<table id="submypage_Input">
					<tr>
						<td id="myUp01">아이디</td>
						<td><input type="text" class="form-control" id="fakeid"
							name="fakeid" disabled="disabled" value="${bean.id}"> <input
							type="hidden" class="form-control custom-textbox" id="id"
							name="id" value="${bean.id}"></td>
					</tr>
					<tr>
						<td id="myUp02">이름</td>
						<td><input type="text" class="form-control" id="fakename"
							name="fakename" disabled="disabled" value="${bean.name}">
							<input type="hidden" class="form-control custom-textbox"
							id="name" name="name" value="${bean.name}"></td>
					</tr>
					<tr>
						<td id="myUp03">닉네임</td>
						<td><input type="text" class="form-control custom-textbox"
							id="join_alias" name="alias" value="${bean.alias}"></td>
						<td><input type="hidden" id="join_aliasCheck"
							name="join_aliasCheck" value="N">
						<button type="button" id="join_DuplicateBtn3">중복확인</button></td>
							
					</tr>
					<tr>
						<td id="myUp04">비밀번호</td>
						<td><input type="password"
							class="form-control custom-textbox" id="join_password" name="password"></td>
					</tr>

					<tr>
						<td id="myUp05">핸드폰번호</td>
						<td><input type="text" class="form-control custom-textbox"
							id="join_phone" name="phone" value="${bean.phone}"></td>
						<td><input type="hidden" id="join_phoneCheck"
							name="join_phoneCheck" value="N">
						<button type="button" id="join_DuplicateBtn2">중복확인</button></td>
					</tr>

					<tr class="join_form_container">
						<td id="myUp06" class="join_label" for="favorite_food">좋아하는 음식:</td>
						<td class="join_food_opt_container">
						<c:set var="foodArray" value="한식,일식,양식,중식" />

							<c:forEach var="tt" items="${foodArray}"  varStatus="loopStatus">
			<label class="join_food_opt_label" for="join_favorite_${loopStatus.index}">
        <input class="join_food_opt" type="checkbox"
               id="join_favorite_${loopStatus.index}" name="taste" value="${tt}"
               <c:if test="${fn:contains(bean.taste, tt)}">checked="checked"</c:if>>
        ${tt}
    </label>
							</c:forEach>
							
						</td>
					
					</tr>
					<tr>
						<td id="myUp07">프로필사진</td>
						<td>
							<div class="input-group">
								<input class="form-control" type="file" id="picture"
									name="picture"> <input type="hidden"
									name="deleteImage" value="${bean.picture}">
							</div>
						</td>
					</tr>


				</table>
				<div class="myupdate_button">

					<div id="update_binselt">
						<button type="submit" id="update_od01" onclick="return validCheck();">수정</button>
					</div>
					<div id="update_binselt">
						<a href="<%=notWithFormTag%>meList&id=${sessionScope.loginfo.id}" id="update_od01">돌아가기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>