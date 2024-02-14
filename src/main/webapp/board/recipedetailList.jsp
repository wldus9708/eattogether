<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/eattogether/css/recipedetailStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true

		});
	});

	function changeImg() {
		var imageElement = $("#myImage");

		if (imageElement.attr('src').endsWith('./../image/emptystar.png')) {
			imageElement.attr('src', './../image/star.png');
		} else {
			imageElement.attr('src', './../image/emptystar.png');
		}
	}
</script>
</head>
<body>
	<div id="recipedetail_entire">
		<div id="recipedetail_contain01">
			<div class="recipe_side0">
				<h3 id="recipe">
					<a href="<%=notWithFormTag%>reList"><p>레시피</p></a>
				</h3>
			</div>

			<div id="accordion">
				<h3>
					<a href="#">양식</a>
				</h3>
				<ul>
					<li><a href="#">파스타</a></li>
					<li><a href="#">리조또</a></li>
					<li><a href="#">스테이크</a></li>
					<li><a href="#">피자</a></li>
					<li><a href="#">오믈렛</a></li>
				</ul>

				<h3>
					<a href="#">한식</a>
				</h3>
				<ul>
					<li><a href="#">김치볶음밥</a></li>
					<li><a href="#">된장찌개</a></li>
					<li><a href="#">김치찌개</a></li>
					<li><a href="#">고등어조림</a></li>
					<li><a href="#">떡볶이</a></li>
				</ul>

				<h3>
					<a href="#">중식</a>
				</h3>
				<ul>
					<li><a href="#">마라탕</a></li>
					<li><a href="#">탕후루</a></li>
					<li><a href="#">짬뽕</a></li>
					<li><a href="#">잡채밥</a></li>
					<li><a href="#">유린기</a></li>
				</ul>

				<h3>
					<a href="#">일식</a>
				</h3>
				<ul>
					<li><a href="#">초밥</a></li>
					<li><a href="#">호토마키</a></li>
					<li><a href="#">우동</a></li>
					<li><a href="#">가라아게</a></li>
					<li><a href="#">덴뿌라</a></li>
				</ul>
			</div>
		</div>
		<div id="recipedetail_contain02">
			<div id="recipedetail_box01">
				<div id="recipedetail1">
					<div>
						<a href="/eattogether/member/Submypage2.jsp" class="userBtn"><img
							src="/eattogether/image/user.png" alt=""></a>
					</div>
					<div>
						<a href="/eattogether/member/Submypage2.jsp" class="userId"><span
							id="recipeDetail_Id">${bean.mem_id}</span></a>
					</div>
					<div>
						<a href="#" class="upBtn"><span id="recipeUp">${bean.rec_hit}</span>
							<img src="/eattogether/image/upBtn.png" alt=""> </a>
					</div>
					<div>
						<a href="#" class="playBtn"><img
							src="/eattogether/image/likes.png" alt=""> </a>
					</div>
					<div>
						<img id="myImage" class="overlay-image right-align"
							src="/eattogether/image/emptystar.png" onclick="changeImg()"
							alt="${bean.rec_bookmark}">
						<!-- 즐겨찾기 -->
					</div>
				</div>
				<div id="recipedetail2">
					<div id="recipe_container">
						<div class="recipe_image">
							<a class="removeUnderLine" href="#"> <img class="card-img"
								src="/eattogether/image/${bean.rec_photo}"
								alt="${bean.rec_photo}"></a>
						</div>
					</div>
				</div>
			</div>
			<div id="recipedetail_box02">
				<table id="recipetitle">
					<tr>
						<th colspan="2" id="re_title">${bean.rec_header}</th>
					</tr>
					<tr>
						<td style="width: 5%;" id="re_mat">재료</td>
						<td style="width: 45%;" id="re_matkind">${bean.rec_material}</td>
					</tr>
					<tr>
						<td style="width: 5%;" id="re_recipe">레시피</td>
						<td style="width: 45%;" id="re_number">
							<ul id="re_Sequence">
								<%
								for (int i = 1; i <= 10; i++) {
									String content = (String) request.getAttribute("rec_content" + i);
									if (content != null && !content.isEmpty()) {
								%>
								<li><%=content%></li>
								<%
								}
								}
								%>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>

</html>
<%@ include file="./../common/footer.jsp"%>