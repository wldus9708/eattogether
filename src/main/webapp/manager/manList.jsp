<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/eattogether/css/mangerListStyle.css">
</head>
<body>
	<div id="contain">
		<div id="box1">
			<a href="/eattogether/manager/manList.jsp" id="ma_memberbt">회원조회</a> <a
				href="/eattogether/notice/mangernotiList.jsp " id="ma_announbt">공지사항</a> <a
				href="/eattogether/inquiry/inquList.jsp" id="ma_inquirybt">문의사항</a>
		</div>
		<div id="box2">
			<div class="manger_searchbox">
				<div id="mansearch_conditions">검색조건</div>
				<div class="mansearch_search">
					<div>
						<input id="mansearch_idsearch" placeholder="아이디">
					</div>
					<div>
						<button id="mansearch_button">
							<img src="/eattogether/image/mangersearch.png" alt="찾기">
						</button>
					</div>
				</div>
			</div>
			<div class="manger_member">
				<table>
				<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>전화번호</td>
				<td><button>탈퇴</button></td>
				</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp" %>