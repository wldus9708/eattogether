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
			<span>나란히 앉은 자동차 속에선
음악도 흐르지 않아
늘 잡고 있던 네 왼손으로 너
입술만 뜯고 있어
네가 할 말 알아, 그 말만은 말아
일분 일초 더 끌고 싶은데
텅빈 길 나를 재촉해
빙빙 돌아온, 너의 집 앞이 나
익숙해, 눈물이 나와
하루가 멀게 찾아온 여기서
길을 내가 잃은 것 같아
이러지마, 제발, 떠나지마, 제발
비도 안 오는 유리창 넘어
뿌옇게 멀어지는 너
말처럼 쉽진 않은 널 보내야 한다는 일
돌아서서 날 버리고 가는 널 보지 못하고 떨구고 마는
눈물도 이젠 닦아야겠지 주머니 속, 네가 줬던 손수건을 써야할지 이젠 버려야 할지
왜 떨림이 멈추질 않지?
미친척하고 널 잡아 보려 해도
내 몸이 내 말을 잘 듣지를 않아
차 안에 남은 네 향기에 취해
영영 깨고 싶지 않은걸
이러지마, 제발, 떠나지마, 제발
돌아와, 돌아와
네가 떠나간 빈자리 위엔
차가운 향기만 남아
이러지마, 제발, 떠나지마, 제발
돌아와, 돌아와
남은 향기만 안고 있을게
돌아와 네 자리로</span>
		</div>

		<div id="delete_message03">

			<c:choose>
				<c:when test="${sessionScope.loginfo.social_key == null}">
					<!-- 일반회원인 경우 -->
					<div id="delete_message_b1"><a href="<%=notWithFormTag%>meDelete&id=${sessionScope.loginfo.id}">예</a></div>
				</c:when>
				<c:otherwise>
					<!-- 카카오 회원인 경우 -->
					<div id="delete_message_b1"><a href="<%=notWithFormTag%>meKakaoDelete&id=${sessionScope.loginfo.id}">예</a></div>
				</c:otherwise>
			</c:choose>

			
			<div id="delete_message_b2"><a href="<%=notWithFormTag%>meList">아니오</a></div>
			
		</div>
	</div>
</body>
</html>
