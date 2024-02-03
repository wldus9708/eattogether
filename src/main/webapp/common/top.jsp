<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./../css/top.css">
<style type="text/css">
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" id="header_wrap">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src="./../image/cooker.png"
				alt="" id="header_img1"> <span id="header_span1">오늘뭐먹지?</span>
			</a>

			<div class="d-flex" style="flex: 0 0 60%;">
				<input class="form-control" type="text" id="header_text">
				<button class="btn btn-light" id="header_button" type="submit">
					<img src="./../image/search.png" alt="" id="header_img2">
				</button>
			</div>

			<div class="d-flex align-items-center">
				<a href="#" class="d-flex flex-row align-items-center"> <img
					src="./../image/user.png" alt="" id="header_img3">
				</a>
				<div id="manheader">
					<ul>
						<li class="header"><a class="header-toggle" role="button"
							href="#" sdata-bs-toggle="dropdown" id="manger">관리자▼</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="#">회원관리</a></li>
								<li><a class="dropdown-item"
									href="#">문의사항</a></li>
								<li><a class="dropdown-item"
									href="./../notice/membernotiList.jsp">공지사항</a></li>
								<li><a class="dropdown-item" href="#">로그아웃</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>
