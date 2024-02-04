<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<%
// appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Eat"; //in FrontController.java file

// 폼 태그에서 사용할 전역 변수
String withFormTag = appName + mappingName;

String notWithFormTag = withFormTag + "?command=";

//out.print("contetxt이름 : " + appName + "<br>");
//out.print("mappingName : " + mappingName + "<br>");
//out.print("withFormTag : " + withFormTag + "<br>");
//out.print("notWithFormTag : " + notWithFormTag + "<br>");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/top.css">
<style type="text/css">
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" id="header_wrap">
		<div class="container-fluid">
			<a class="navbar-brand" href="../common/main.jsp"> <img src="/eattogether/image/cooker.png"
				alt="" id="header_img1"> <span id="header_span1">오늘뭐먹지?</span>
			</a>

			<div class="d-flex" style="flex: 0 0 60%;">
				<input class="form-control" type="text" id="header_text">
				<button class="btn btn-light" id="header_button" type="submit">
					<img src="/eattogether/image/search.png" alt="" id="header_img2">
				</button>
			</div>

			<div class="d-flex align-items-center">
				<a href="#" class="d-flex flex-row align-items-center"> <img
					src="/eattogether/image/user.png" alt="" id="header_img3">
				</a>
				<div id="manheader">
					<ul>
						<li class="header"><a class="header-toggle" role="button"
							href="#" sdata-bs-toggle="dropdown" id="manger">닉네임▼</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="../member/login.jsp">로그인</a></li>
								<li><a class="dropdown-item"
									href="<%=notWithFormTag%>meAgree">회원가입</a></li>
								<li><a class="dropdown-item"
									href="../member/MyPage2.jsp">마이페이지</a></li>
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
