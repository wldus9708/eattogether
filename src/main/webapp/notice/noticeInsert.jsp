<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/mangerheader.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validCheck(){/* 폼 유효성 검사 */
	var subject = $('#not_header').val();
	if(subject.length < 3 || subject.length > 20){
		alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
		$('#not_header').focus() ;
		return false ;
	}
	
	var contents = $('#not_contents').val();
	if(contents.length < 5 || contents.length > 100){
		alert('글 내용은 5글자 이상 100글자 이하이어야 합니다.');
		$('#not_contents').focus() ;
		return false ;
	}
	function getCurrentDateTime() {
        const now = new Date();
        
        // 월과 일이 한 자리 숫자인 경우 앞에 0을 추가해줍니다.
        const month = (now.getMonth() + 1).toString().padStart(2, '0');
        const day = now.getDate().toString().padStart(2, '0');
        
        // 날짜를 YYYY-MM-DD 형식으로 반환합니다.
        return `${now.getFullYear()}-${month}-${day}`;
    }

    // 등록일자 input 요소에 현재 날짜를 설정하는 부분
    document.getElementById('not_regdate').value = getCurrentDateTime();
</script>
<style type="text/css">
body{
background-color: #F8EBCE;
}
#not_no,#man_id,#fakeid {
	display: none;
	visibility: hidden;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>공지사항 등록</h2>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="notiInsert">
			<div id="not_no" class="input-group mb-3">
				<span class="input-group-text">글번호</span> <input type="text"
					class="form-control" id="not_no" name="not_no">
			</div>
			<div class="input-group mb-3">

				<c:set var="userInfo" value="${sessionScope.loginfo.mem_no}" />

				<span class="input-group-text" id="man_id">작성자</span> <input type="text"
					class="form-control" id="fakeid" name="fakeid" disabled="disabled" value="${userInfo}"> <input type="hidden" id="id" name="id"
					value="${sessionScope.loginfo.mem_no}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" >등록일자</span> <input type="datetime-local"
					class="form-control" disabled="disabled" id="not_regdate" name="not_regdate">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글제목</span> <input type="text"
					class="form-control" id="not_header" name="not_header">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글내용</span> <textarea type="text"
					class="form-control" id="not_contents" name="not_contents"></textarea>
			</div>
			<div id="buttonset" class="input-group mb-3">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();">등록</button>
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>