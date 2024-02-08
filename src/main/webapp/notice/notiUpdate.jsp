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

document.getElementById('noti_content').value = "${bean.noti_content}";

function validCheck(){/* 폼 유효성 검사 */
	var noti_header = $('#noti_header').val();
	if(noti_header.trim() === ''){
		alert('글제목이 없습니다.');
		$('#noti_header').focus();
        return false;
	}
	
	var noti_content = $('#noti_content').val();
	if(noti_content.trim() === ''){
		alert('글내용이 없습니다.');
		$('#noti_content').focus() ;
		return false ;
	}
}
	
</script>
<style type="text/css">
body {
	background-color: #F8EBCE;
}

#noti_no, #man_id, #fakeid {
	display: none;
	visibility: hidden;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>공지사항 등록</h2>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="notiUpdate">
			
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
			
			<div id="noti_no" class="input-group mb-3">
				<span class="input-group-text">글번호</span> <input type="text"
					class="form-control" id="noti_no" name="noti_no" value="${bean.noti_no}" disabled="disabled">
					<input type="hidden" id="noti_no" name="noti_no" value="${bean.noti_no}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글제목</span> <input type="text"
					class="form-control" id="noti_header" name="noti_header" value="${bean.noti_header}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글내용</span>
				<textarea class="form-control" id="noti_content"
					name="noti_content">${bean.noti_content}</textarea>
			</div>
			<div id="buttonset" class="input-group mb-3">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();">수정하기</button>
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>