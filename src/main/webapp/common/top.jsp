<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./top.css">
<style type="text/css">

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" id="header_wrap">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src="./../img/cooker.png"
				alt="" id="header_img1"> <span id="header_span1">오늘뭐먹지?</span>
			</a>

			<div class="d-flex" style="flex: 0 0 60%;">
				<input class="form-control" type="text" id="header_text">
				<button class="btn btn-light" id="header_button" type="submit">
					<img src="./../img/search.png" alt="" id="header_img2">
				</button>
			</div>

			<div class="d-flex align-items-center">
				<a href="#" class="d-flex flex-row align-items-center"> <img
					src="./../img/user.png" alt="" id="header_img3"> <span
					id="header_span2">가나다라</span>
				</a>
			</div>
		</div>
	</nav>
</body>
</html>
