<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<c:set var="whologin" value="0" />
<c:if test="${not empty sessionScope.loginfo}">
    <c:choose>
        <c:when test="${sessionScope.loginfo.flag eq '2'}">
            <c:set var="whologin" value="2" />
        </c:when>
        <c:when test="${sessionScope.loginfo.flag eq '1'}">
            <c:set var="whologin" value="1" />
        </c:when>
        <c:when test="${sessionScope.loginfo.flag eq '3'}">
            <c:set var="whologin" value="3" />
        </c:when>
    </c:choose>
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
			<a class="navbar-brand" href="/eattogether/common/main.jsp"> <img
				src="/eattogether/image/cooker.png" alt="" id="header_img1"> <span
				id="header_span1">오늘뭐먹지?</span>
			</a>
			<c:if test="${whologin ne 2 }">
				<form action="<%=withFormTag%>" method="get">
				<div class="d-flex" >
									<input type="hidden" name="command" value="reList">
					<input class="form-control" type="text"  name="keyword" id="topsearch">
					<button class="btn btn-light" id="header_button" type="submit">
						<img src="/eattogether/image/search.png" alt="" id="header_img2">
					</button>
				</div>
					</form>
			</c:if>
			<div class="d-flex align-items-center">
				<a href="#" class="d-flex flex-row align-items-center">
				<c:if test="${whologin eq 0 }"> <img
					src="/eattogether/image/user.png" alt="" id="header_img3">
					</c:if>
					<c:if test="${whologin eq 1 || whologin eq 3 }"> <img
					src="/eattogether/image/${sessionScope.loginfo.picture}" alt="" id="header_img3">
					</c:if>
				</a>
				<div id="manheader">
					<ul>
						<li class="header"><c:if test="${whologin eq 0 }">
								<a class="header-toggle" role="button" href="#"
									sdata-bs-toggle="dropdown" id="manger">로그인▼</a>
							</c:if> <c:if test="${whologin eq 1 || whologin eq 3}">
								<a class="header-toggle" role="button" href="#"
									sdata-bs-toggle="dropdown" id="manger">${sessionScope.loginfo.alias}님▼</a>
							</c:if> <c:if test="${whologin eq 2 }">
								<a class="header-toggle" role="button" href="#"
									sdata-bs-toggle="dropdown" id="manger">${sessionScope.loginfo.alias}님▼</a>
							</c:if>
							<ul class="dropdown-menu">
								<c:if test="${whologin eq 0 }">
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meLogin">로그인</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meAgree">회원가입</a></li>
								</c:if>
								<c:if test="${whologin eq 1 || whologin eq 3}">
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meList&id=${sessionScope.loginfo.id}">마이페이지</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>reList">레시피</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>notiList">공지사항</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>inquList">문의사항</a></li>
											<!-- 일반회원인 경우 -->
											<!-- 그냥 로그아웃 링크만 표시 -->
											<c:if test="${whologin eq 1}">
											<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meLogout">로그아웃</a></li>
										</c:if>
										<c:if test="${whologin eq 3}">
											<!-- 카카오 회원인 경우 -->
											<li><a class="dropdown-item"
												href="https://kauth.kakao.com/oauth/logout?client_id=5975a25df2fa8cac4ce9ba8863d45540&logout_redirect_uri=http://localhost:8090/eattogether/Eat?command=meKakaoLogout">카카오 로그아웃</a></li>
								</c:if>
								</c:if>
								<c:if test="${whologin eq 2 }">

									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>manList">회원관리</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>inquList&id=${session.loginfo.id}">문의사항</a></li>
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>notiList">공지사항 관리</a></li>
										
									<li><a class="dropdown-item"
										href="<%=notWithFormTag%>meLogout">로그아웃</a></li>
								</c:if>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- 사용자에게 주의/경고/오류 등을 알려주기 위한 Alert Box  -->
	<c:if test="${not empty sessionScope.alertMessage }">
		<div class="alert alert-danger alert-dismissible" style="background:#ED6D35;">
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>경고 메시지 : </strong> ${sessionScope.alertMessage}
		</div>
	</c:if>
	<c:remove var="alertMessage" scope="session" />

</body>
</html>
