<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./../css/recipedetailStyle.css">
</head>
<body>
	<div id="recipedetail_entire">
		<div id="recipedetail_box01">
			<div id="recipedetail1">
				<div>
					<a href="#" class="userBtn"><img src="./../image/user.png"
						alt=""></a>
				</div>
				<div>
					<a href="#" class="userId"><span id="recipeDetail_Id">phwoo</span></a>
				</div>
				<div>
					<a href="#" class="upBtn"><span id="recipeUp">4520</span> <img
						src="./../image/upBtn.png" alt=""> </a>
				</div>
				<div>
					<a href="#" class="playBtn"><img src="./../image/playBtn.png"
						alt=""> </a>
				</div>
				<div>
					<a href="#" class="starBtn"><img src="./../image/starBtn.png"
						alt=""> </a>
				</div>
				<div id="recipedetail2">
					<div id="recipe_container">
						<div class="recipe_image">
							<a class="removeUnderLine" href="#"> <img class="card-img"
								src="./../image/vongole pasta.png" alt=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="recipedetail_box02">
			<table id="recipetitle">
				<tr>
					<td colspan="2" id="re_title">맛있는 파스타</td>
				<tr>
					<td style="width: 5%;" id="re_mat">재료</td>
					<td style="width: 45%;" id="re_matkind">재료종류</td>
				</tr>
				<tr>
					<td style="width: 5%;" id="re_recipe">레시피</td>
					<td style="width: 45%;" id="re_number">레시피순서</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<%@ include file="./../common/footer.jsp"%>