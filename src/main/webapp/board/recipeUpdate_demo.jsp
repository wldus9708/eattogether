<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/recipeUpdate_demo.css">
<script>
	function clearValue(input) {
		input.value = ''; // 클릭 시 value 값을 빈 문자열로 설정
	}
</script>
</head>
<body>
	<header>
		<div class="back-container">
			<a href="#"> <img src="./../image/back.png" alt="뒤로가기"
				class="recipe_Update_dack">
			</a>
		</div>
	</header>
	<section>
		<div class="recipe_Update_title">
			<input type="text" class="recipe_Update_title02" id="title"
				name="title" value="제목을 입력하세요" onclick="clearValue(this)">
		</div>
		<div class="recipe_Update_food-basic">
			<span class="recipe_Update_food-name">재료 : </span> 
			<input type="password" class="recipe_Update_food-basic02" id="basic" name="basic">
		</div>
		<div class="recipe_Update_food-recipe">
			<span class="recipe_Update_food-name">레시피 : </span> 
			<span class="recipe_Update_food">1</span> 
			<input type="text" class="form-control" id="subject" name="subject">
		</div>
		<div class="recipe_Update_food-recipe">
			<span class="recipe_Update_food">2</span> 
			<input type="text" class="form-control" id="contents" name="contents">
		</div>
		<div class="recipe_Update_food-recipe">
			<span class="recipe_Update_food">3</span> 
			<input type="text" class="form-control" id="contents" name="contents">
		</div>
		<div id="buttonset" class="input-group mb-3">
			<button type="reset" class="btn btn-primary btn-lg">수정하기</button>
			&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-secondary btn-lg">등록하기</button>
		</div>
	</section>
</body>
</html>