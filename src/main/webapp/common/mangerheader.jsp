<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/eattogether/css/manheaderStyle.css">
  
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<nav>
		<div id="gr">
			<div id="logo">
				<a href="/eattogether/common/main.jsp"> <img src="/eattogether/image/cooker.png">
				</a> <a id="logo_a" href="/eattogether/common/main.jsp">오늘 뭐먹지</a>
			</div>
			<div id="manheader">
				<ul>
					<li class="header">
					<a class="header-toggle"  role="button" href="#" sdata-bs-toggle="dropdown" id="manger">${sessionScope.loginfo.alias}님▼</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>manList">회원관리</a></li>
							<li><a class="dropdown-item" href="/eattogether/inquiry/inquList.jsp">문의사항</a></li>
							<li><a class="dropdown-item" href="/eattogether/notice/mangernotiList.jsp">공지사항 관리</a></li>
							<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogout">로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<script type="text/javascript">
		
	</script>
</body>

</html>