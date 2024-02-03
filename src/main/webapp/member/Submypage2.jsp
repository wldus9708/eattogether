<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="./submypage2.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div id="submypage00">
		<img src="./../img/cooker.png" id="subexit" alt="Cinque Terre">
		<img src="./../img/user.png" id="subhome" alt="Cinque Terre">
	</div>
	<div id="submypage_box00">
		<div class="custom-shape" id="submyicon">
			<img src="./../image/juice01.png" class="submypage_icon"
				alt="Cinque Terre">
		</div>
		<div id="submypage_box10">
			<div class="submypage_box03" id="submyname">
				<span>이름</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>
			<div class="submypage_box03" id="submynname">
				<span>닉네임</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>
			<div class="submypage_box03" id="submyfood">
				<span>음식취향</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>


			<div class="submypage_box02" id="submypage21">
				<span>이름</span>
				<div>
					<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
					<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
					<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
					<img src="./../image/juice01.png" class="subima" alt="Cinque Terre">
				</div>
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