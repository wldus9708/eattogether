<%@page import="com.eattogether.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
//appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Eat"; //in FrontController.java file

//폼 태그에서 사용할 전역 변수
String withFormTag = appName + mappingName;

String notWithFormTag = withFormTag + "?command=";
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/eattogether/css/findPassword.css">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script type="text/javascript">
    function validateForm() {
        var id = document.getElementById("findPwd_id").value;
        var name = document.getElementById("findPwd_name").value;
        var phone = document.getElementById("findPwd_phone").value;

        if (id.trim() === "" || name.trim() === "" || phone.trim() === "") {
            alert("모든 정보를 입력하세요.");
            return false;
        }
        return true;
    }
  
</script>
</head>
<body>
	<c:if test="${not empty sessionScope.alertMessage }">
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>경고 메시지 : </strong> ${sessionScope.alertMessage}
		</div>
	</c:if>
	<c:remove var="alertMessage" scope="session" />
	<div id="findPassword_wrap">
		<h2>비밀번호 찾기</h2>
		<br>
		<div class="titleArea">
			<ul>
				<li>본인 이름과 가입하실때 입력한 전화번호, 아이디를 입력하시면</li>
				<li>이메일로 임시 비밀 번호가 발송됩니다.</li>
			</ul>
		</div>

		<form name="frmfindPwd" method="post" action="<%=withFormTag%>" onsubmit="return validateForm()">
			<input type="hidden" name="command" value="meFindPwd">
			<div class="findPwd_form_container">
				<label class="findPwd_label" for="id">아이디:</label> <input
					class="findPwd_input_field" type="text" id="findPwd_id" name="id"
					maxlength="30">
			</div>
			<div class="findPwd_form_container">
				<label class="findPwd_label" for="name">이름:</label> <input
					class="findPwd_input_field" type="text" id="findPwd_name"
					name="name" maxlength="8">
			</div>
			<div class="findPwd_form_container">
				<label class="findPwd_label" for="phone">전화번호:</label> <input
					class="findPwd_input_field" type="text" id="findPwd_phone"
					name="phone" maxlength="11" placeholder="'-'빼고 입력해주세요. ">
			</div>
			<div id="findPwd_btn">
				<input type="submit" id="findPwd_submit" value="비밀번호 찾기">
			</div>
		</form>
	</div>
</body>
</html>
