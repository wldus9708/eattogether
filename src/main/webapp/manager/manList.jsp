<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/mangerheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./../css/mangerListStyle.css">
</head>
<body>
	<div id="body">
		<div id="box1">
			<button id="ma_memberbt">회원조회</button>
			<button id="ma_announbt">공지사항</button>
			<button id="ma_inquirybt">문의사항</button>
		</div>
		<div id="box2">
			<div id="section-box">
				<div id="ma_sequence">
					<p>조회기준</p>
				</div>
				<input type="text" id="ma_criteria_input"
					placeholder="입력 가능한 텍스트 박스">
			</div>
			<div id="section-box">
				<div id="ma_search">
					<p>검색조건</p>
				</div>
				<input type="text" id="ma_condition_input"
					placeholder="입력 가능한 텍스트 박스">
			</div>


		</div>
	</div>
</body>
<%@include file="./../common/footer.jsp" %>
</html>