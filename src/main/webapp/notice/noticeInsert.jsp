<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/mangerheader.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<h2>공지사항 등록</h2>
		<p>관리자가 게시물을 등록하는 페이지입니다.</p>

		<form action="<%=%>" method="post">
			<input type="hidden" name="command" value="notiInsert">
			<div id="not_no" class="input-group mb-3">
				<span class="input-group-text">글번호</span> <input type="text"
					class="form-control" id="not_no" name="not_no">
			</div>
			<div class="input-group mb-3">

				<c:set var="userInfo" value="#" />

				<span class="input-group-text">작성자</span> <input type="text"
					class="form-control" id="fakeid" name="fakeid" value="${userInfo}"
					disabled="disabled"> <input type="hidden" id="id" name="id"
					value="${sessionScope.loginfo.id}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">등록일자</span> <input type="date"
					class="form-control" id="not_regdate" name="not_regdate">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글제목</span> <input type="text"
					class="form-control" id="not_header" name="not_header">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">글내용</span> <input type="text"
					class="form-control" id="not_contents" name="not_contents">
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