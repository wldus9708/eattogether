<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/eattogether/css/recipeInsert.css">
</head>
<style>
#productPnum {
	display: none;
	visibility: hidden;
} /* 상품 번호는 안보이게 지정*/
</style>
<body>
	<h2>상품 등록</h2>
	<p>관리자가 구매할 상품을 등록하는 페이지입니다.</p>
	<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="reInsert">
		<div id="productPnum" class="input-group">
			<span class="input-group-text">레시피 번호</span> 
			<input class="form-control" name="rec_no" type="number" id="rec_no">
		</div>
		<div class="recipe_Update_title">
			<input type="text" name="rec_header" id="rec_header" class="recipe_Update_title02"
				 placeholder="제목을 입력하세요">
		</div>
		<div>
			<input type="file" name="rec_photo" id="image-input" accept="image/*"> 
			<img src="/eattogether/image/basicicon.png" id="image-preview" alt="사진">
		</div>
		<div class="row">
			<div class="col-sm-3">
				<div class="recipe_Update_food-basic">
					<div class="recipe_Update_food-name">작성자 : </div>
					<div class="recipe_Update_food-name">카테고리 :</div>
					<div class="recipe_Update_food-name">재료 :</div>
					<div class="recipe_Update_food-name">레시피 :</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="recipe_Update_food-basic">
					<c:set var="userInfo" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})"/>
					<input type="text" class="form-control" id="fakeid" name="fakeid" value="${userInfo}" disabled="disabled">
					<input type="hidden" id="id" name="mem_id" value="${sessionScope.loginfo.id}">
				</div>
				<div class="recipe_Update_food-basic">
					<select id="category" name="cat_no" class="recipe_text_basic">
						<option value="카테고리">--------카테고리를 선택해주세요.--------</option>
						<option value="1">양식</option>
						<option value="2">한식</option>
						<option value="3">중식</option>
						<option value="4">일식</option>
					</select>
				</div>
				<div class="recipe_Update_food-basic">
					<input type="text"  name="rec_material" class="recipe_text_basic" id="basic">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">1</span>
					<input type="text" name="rec_content01" class="recipe_text" id="contents" >
				</div>
				<button type="button" class="btn" id="add-recipe">추가</button>
			</div>
		</div>
		<div class="button">
			<a>
				<button type="submit" class="btn recipe_Insert_button"
					id="insert_btn01">등록</button>
			</a>
		</div>
	</form>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var addButton = document.getElementById('add-recipe');
			addButton.addEventListener('click', function() {
				var recipeUpdateFoodRecipe = document
						.getElementsByClassName('recipe_Update_food-recipe');
				var newDiv = document.createElement('div');
				newDiv.className = 'recipe_Update_food-recipe';

				var newSpan = document.createElement('span');
				newSpan.className = 'recipe_Update_food';
				newSpan.textContent = recipeUpdateFoodRecipe.length + 1;
				newDiv.appendChild(newSpan);

				var newInput;
				if (recipeUpdateFoodRecipe.length > 0) {
					newInput = document.createElement('input');
					newInput.type = 'text';
					newInput.className = 'recipe_text';
					newInput.name = 'contents';
				} else {
					newInput = document.createElement('input');
					newInput.type = 'hidden';
					newInput.className = 'recipe_text';
					newInput.name = 'contents';
				}
				newDiv.appendChild(newInput);

				document.getElementById('add-recipe').parentNode.insertBefore(
						newDiv, addButton);
			});
		});

		// 파일 입력(input) 엘리먼트
		const imageInput = document.getElementById('image-input');

		// 이미지 미리보기를 나타낼 이미지 엘리먼트
		const imagePreview = document.getElementById('image-preview');

		// 파일 입력이 변경될 때 이벤트 처리
		imageInput.addEventListener('change', function(event) {
			// 선택한 파일 가져오기
			const file = event.target.files[0];

			// 파일이 존재하면
			if (file) {
				// 파일을 읽기 위한 FileReader 객체 생성
				const reader = new FileReader();

				// 파일 읽기가 완료되었을 때의 이벤트 처리
				reader.onload = function(e) {
					// 읽은 데이터를 이미지 엘리먼트의 소스에 설정하여 이미지를 보여줌
					imagePreview.src = e.target.result;
				};

				// 파일을 읽기 시작
				reader.readAsDataURL(file);
			} else {
				// 파일이 선택되지 않았을 때 기본 이미지로 설정
				imagePreview.src = '';
			}
		});
	</script>
</body>
</html>
<%@ include file="./../common/footer.jsp"%>