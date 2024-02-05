<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/footer.css">
<style type="text/css">
</style>
</head>
<body>

	<footer id="footer_wrap">
		<div id="footer_menu">
			<a href=/eattogether/company/company.jsp>회사소개</a> <a
				href=/eattogether/privacy.jsp target="_blank">개인정보취급방침</a> <a
				href=/eattogether/agreement.jsp target="_blank">이용약관</a> <a href=#>공지사항</a>
		</div>
		<div class="footer_left">
			<div class="row">
				<div class="col-sm-4 footer_text">
					<h3>(주)오늘 뭐먹지?</h3>
					<p>대표 : 김지연&nbsp;&nbsp;&nbsp;TEL 02-9999-9999
						&nbsp;&nbsp;&nbsp;FAX 02-9999-9999</p>
				</div>
				<div class="col-sm-4 footer_text">
					<p>본사 주소 : 서울특별시 마포구 백범로 23, 3층 302호 (신수동, 케이터틀)</p>
					<p>운영시간 평일 10:00~18:00</p>
					<p>사업자등록번호 : 123-45-67890
				</div>
				<div class="col-sm-4 footer_text">
					<p>통신판매업신고번호 : 제 2024-서울서대문-302호</p>
					<p>대표 메일, 광고문의 onlyone@onlyone.co.kr</p>
					<p>Copyright © 오늘 뭐먹지?. All rights reserved.</p>
				</div>
			</div>
		</div>
		<div class="footer_center">
			<img src="../image/macaron01.png">
		</div>
		<c:if test="${whologin eq 1 }">
			<div class="footer_right">
				<div id="footer_box">
					<span>문의하기</span>
					<button id="footer_butt">전송</button>
					<textarea id=footer_messagebox></textarea>
				</div>
				<div></div>
			</div>
		</c:if>
	</footer>
	
</body>
</html>
