<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/mydataupdate2.css">
<style>
</style>
</head>
<body>
		<div id="updateMypage_entir">

		<div id="myupdate_box00">
			<div class="custom-shape" id="myupdateicon">
				<img src="/eattogether/image/pizza_01.jpg" id="myupdate_icon">
			</div>

		</div>
		<div id="myupdate_box10">
		<form action="<%=withFormTag%>" method="post">
		<input type="hidden" name="command" value="meUpdate">
			<table id="submypage_Input">
				<tr>
					<td id="myUp01">아이디</td>
					<td>
					
					<input type="text"class="form-control" id="fakeid" name="fakeid"
				disabled="disabled" value="${bean.id}">
					<input type="hidden" class="custom-textbox"
						id="id" name="id" value="${bean.id}"></td>
				<tr>
				<tr>
					<td id="myUp02">이름</td>
					<td>
					<input type="text"class="form-control" id="fakename" name="fakename"
				disabled="disabled" value="${sessionScope.loginfo.name}">
					<input type="hidden" class="custom-textbox"
						id="name" name="name" value="${sessionScope.loginfo.name}"></td>
				<tr>
				<tr>
					<td id="myUp03">닉네임</td>
					<td><input type="text" class="custom-textbox"
						id="alias" name="alias" value="${bean.alias}"></td>
				<tr>
				<tr>
					<td id="myUp04">비밀번호</td>
					<td><input type="password" class="custom-textbox"
						id="password" name="password" value="${bean.password}"></td>
				<tr>

				<tr>
					<td id="myUp05">핸드폰번호</td>
					<td><input type="text" class="custom-textbox"
						id=" phone" name=" phone" value="${bean. phone}"></td>
				<tr>

				<tr>
					<td id="myUp06">좋아하는 음식</td>
					<td><input type="text" class="custom-textbox"
						id="taste" name="taste" value="${bean.taste}"></td>
				<tr>
			
			</table>
						<div class="myupdate_button">
					
					<div id="update_binselt">
						<button type="submit" id="update_od01"
						>수정</button>
					</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="./../common/footer.jsp"%>