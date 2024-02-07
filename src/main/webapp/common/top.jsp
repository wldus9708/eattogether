<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<c:set var="whologin" value="0"/>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.flag =='2'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.flag !='2'}">
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>
<%
// appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Eat"; //in FrontController.java file

// 폼 태그에서 사용할 전역 변수
String withFormTag = appName + mappingName;

String notWithFormTag = withFormTag + "?command=";

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
			<a class="navbar-brand" href="/eattogether/common/main.jsp"> <img src="/eattogether/image/cooker.png"
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
						<li class="header">
						<c:if test="${whologin eq 0 }">
							<a class="header-toggle" role="button"
							href="#" sdata-bs-toggle="dropdown" id="manger">로그인▼</a>
						</c:if>
						<c:if test="${whologin ne 0 }">
							<a class="header-toggle" role="button"
							href="#" sdata-bs-toggle="dropdown" id="manger">${sessionScope.loginfo.alias}님▼</a>
						</c:if>
							<ul class="dropdown-menu">
								<c:if test="${whologin eq 0 }">
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meLogin">로그인</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meAgree">회원가입</a></li>
								</c:if>
								<c:if test="${whologin eq 1 }">
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meList">마이페이지</a></li>
									<li><a class="dropdown-item"
										href="/eattogether/board/recipe.jsp">레시피</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meLogout">로그아웃</a></li>
								</c:if>
								<c:if test="${whologin eq 2 }">
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>manList">관리자페이지</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meLogout">로그아웃</a></li>	
								</c:if>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- 사용자에게 주의/경고/오류 등을 알려주기 위한 Alert Box  -->
	<c:if test="${not empty sessionScope.alertMessage }">
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>경고 메시지 : </strong> ${sessionScope.alertMessage}
		</div>
	</c:if>
	<c:remove var="alertMessage" scope="session" />
	
</body>
</html>
