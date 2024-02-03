
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<link rel="stylesheet" type="text/css" href="./mypage2.css">
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<
	<div id="mypage00">
		<img src="./../img/cooker.png" id="exit" alt="Cinque Terre"> <img
			src="./../img/user.png" id="home" alt="Cinque Terre">
	</div>
	<div id="mypage_box00">
		<div class="custom-shape" id="myicon">
			<img src="./../image/juice01.png" class="mypage_icon"
				alt="Cinque Terre">
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
			<div class="mypage_box03" id="myname">
				<span>이름</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>
			<div class="mypage_box03" id="mynname">
				<span>닉네임</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>
			<div class="mypage_box03" id="myfood">
				<span>음식취향</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>
			<div class="mypage_box03" id="mycomment">
				<span>코멘트</span> <input type="text" id="custom-textbox"
					placeholder="여기에 입력하세요">
			</div>
		</div>
	</div>
	<div id="mypage_box01">
		<div class="mypage_box02" id="mypage21">
			<span>이름</span>
			<div>
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
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
		<br>
		<div class="mypage_box02" id="mypage22">
			<span>이름</span>
			<div>
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
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
		<br>
		<div class="mypage_box02" id="mypage23">
			<span>이름</span>
			<div>
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
				<img src="./../image/juice01.png" class="ima" alt="Cinque Terre">
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
	
</body>
<%@include file="./../pro/footer.jsp"%>
</html>
