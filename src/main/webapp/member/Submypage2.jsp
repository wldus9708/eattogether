<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./../css/submypage2.css">
<style>
</style>
</head>
<body>
	<div id="submypage_entir">
		<div id="submypage_contain01">
			<div id="submypage_box01">
				<div class="custom-shape" id="submyicon">
					<img src="./../image/steak_02.jpg" id="submypage_icon">
				</div>
			</div>
			<div id="submypage_box02">
				<table id="submypage_Input">
					<tr>
						<td id="submyname">이름</td>
						<td><input type="text" id="custom-textbox"
							placeholder="여기에 입력하세요"></td>
					<tr>
					<tr>
						<td id="submyid">닉네임</td>
						<td><input type="text" id="custom-textbox"
							placeholder="여기에 입력하세요"></td>
					<tr>
					<tr>
						<td id="submyfood">음식취향</td>
						<td><input type="text" id="custom-textbox"
							placeholder="여기에 입력하세요"></td>
					<tr>
				</table>
			</div>
		</div>

		<div id="submypage_contain02">
			<div class="submypage_Bookmark01">
				<span>이름</span>
			</div>
			<div class="submypage_Bookmark02">
				<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
			</div>
			<div class="submypage_Bookmark03">
				<ul class="pagination pagination-sm justify-content-center">
					<li class="page-item"><a class="page-link"
						href="javascript:void(0);">Previous</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0);">1</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0);">2</a></li>
					<li class="page-item"><a class="page-link"
						href="javascript:void(0);">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>