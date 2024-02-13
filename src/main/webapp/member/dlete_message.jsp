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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/dlete_message.css">
</head>
<body>
	<div class="delete_message">
		<div id="delete_message01"><span>정말 탈퇴하시겠습니까?</span></div>

		<div id="delete_message02">
			<span></span>
		</div>

		<div id="delete_message03">
		<a href="<%=notWithFormTag%>meDelete&id=${sessionScope.loginfo.id}">
			<div id="delete_message_b1">예</div>
			</a>
			<a href="<%=notWithFormTag%>meList">
			<div id="delete_message_b2">아니오</div>
			</a>
		</div>
	</div>
</body>
</html>
