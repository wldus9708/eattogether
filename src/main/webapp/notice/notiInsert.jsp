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
$(document).ready(function() {

});

function validCheck(){/* 폼 유효성 검사 */
	var not_header = $('#not_header').val();
	if(not_header.trim() === ''){
		alert('글제목이 없습니다.');
		$('#not_header').focus();
        return false;
	}
	
	var not_content = $('#not_content').val();
	if(not_content.trim() === ''){
		alert('글내용이 없습니다.');
		$('#not_content').focus() ;
		return false ;
	}
}
	
</script>
<style type="text/css">
body {
	background-color: #F8EBCE;
}

#not_no, #man_id, #fakeid {
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
				<span class="input-group-text">글제목</span> <input type="text"
					class="form-control" id="not_header" name="not_header">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글내용</span>
				<textarea type="text" class="form-control" id="not_content"
					name="not_content"></textarea>
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