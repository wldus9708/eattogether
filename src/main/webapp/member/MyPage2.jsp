<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/mypage2.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<div class="Mypage_ntr">
	<div id="mypage_box00">
		<div class="custom-shape" id="myicon">
			<img src="/eattogether/image/pasta_01.jpg" id="mypage_icon" alt=" ">
		</div>
		<div class="mypage_button">
			<a href="#">
				<div id="bupdate">
					<p id="od00">레시피등록</p>
				</div>
			</a> <a href="#">
				<div id="binselt">
					<p id="od01">레시피수정</p>
				</div>
			</a>
		</div>
		<div id="mypage_box10">
			<table id="submypage_Input">
				<tr>
					<td id="submyname" style ="width:25%">이름</td>
					<td><span>이름(나중에EL&JSTL쓸곳)</span></td>
				<tr>
				<tr>
					<td id="submyid" style ="width:25%">닉네임</td>
					<td><span>닉네임(나중에EL&JSTL쓸곳)</span></td>
				<tr>
				<tr>
					<td id="submyfood" style ="width:25%">음식취향</td>
					<td><span>음식취향(나중에EL&JSTL쓸곳)</span></td>
				<tr>
				<tr>
					<td id="subcoment" style ="width:25%">코멘트</td>
					<td><span>코멘트(나중에EL&JSTL쓸곳)</span></td>
				<tr>
			</table>
		</div>
	</div>
	

	<div id="submypage_contain02">
		<div class="mysubpage_box01">
			<div class="submypage_Bookmark01">
				<div>'닉네임'의 즐겨찾기</div>
			</div>
			<div class="submypage_Bookmark02">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
			</div>
		</div>
		<div class="mysubpage_box01">
			<div class="submypage_Bookmark01">
				<div>내가 만든 레시피</div>
			</div>
			<div class="submypage_Bookmark02">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
			</div>
		</div>
		<div class="mysubpage_box01">
			<div class="submypage_Bookmark01">
				<div>닉네임'의 최근본 목록</div>
			</div>
			<div class="submypage_Bookmark02">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
				<img src="/eattogether/image/steak_02.jpg" id="subima">
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@include file="./../common/footer.jsp" %>
