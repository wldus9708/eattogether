<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<%@include file="./../common/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./../css/recipedetailStyle.css">
<script>
  $( function() {
    $( "#accordion" ).accordion({
      collapsible: true
      
    });
  } );
  
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
				<a href="#" class="playBtn"><img src="./../image/likes.png"
					alt=""> </a>
			</div>
			<div>
				<img id="myImage" class="overlay-image right-align"
					src="./../image/emptystar.png" onclick="changeImg()" alt="즐겨찾기">
			</div>
		</div>
		<div id="recipedetail2">
			<div id="recipe_container">
				<div class="recipe_image">
					<a class="removeUnderLine" href="#"> <img class="card-img"
						src="./../image/steak_01.jpg" alt=""></a>
				</div>
			</div>
		</div>
	</div>
	<div id="recipedetail_box02">
		<table id="recipetitle">
			<tr>
				<th colspan="2" id="re_title">맛있는 파스타</th>
			</tr>
			<tr>
				<td style="width: 5%;" id="re_mat">재료</td>
				<td style="width: 45%;" id="re_matkind">재료종류</td>
			</tr>
			<tr>
				<td style="width: 5%;" id="re_recipe">레시피</td>
				<td style="width: 45%;" id="re_number">
				<ul id="re_Sequence">
				<li>면을 넣습니다</li>
				<li>바지락을 넣습니다</li>
				<li>면을 넣습니다</li>
				<li>바지락을 넣습니다</li>
				<li>면을 넣습니다</li>
				<li>바지락을 넣습니다</li>
				</ul>
				</td>
			</tr>
		</table>
	</div>
</body>

</html>
<%@ include file="./../common/footer.jsp"%>