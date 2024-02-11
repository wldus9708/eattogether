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
	href="/eattogether/css/recipeUpdate.css">
</head>
<body>
	<section>
		<div class="recipe_Update_title">
			<input type="text" class="recipe_Update_title02" id="title"
				name="title" placeholder="레시피 제목을 입력하세요" value="${bean.rec_header}">
		</div>
		<div>
			<input type="file" id="image-input" accept="image/*"> <img
				src="/eattogether/image/${bean.rec_photo}" id="image-preview" alt="사진">
		</div>
		<div class="row">
			<div class="col-sm-3">
				<div class="recipe_Update_food-basic">
					<div class="recipe_Update_food-name">카테고리 :</div>
					<div class="recipe_Update_food-name">재료 :</div>
					<div class="recipe_Update_food-name">레시피 :</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="recipe_Update_food-basic">
					<input type="text" class="recipe_text_basic" id="basic"
						name="basic" value="${bean.rec_material}">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">1</span> <input type="text"
						class="recipe_text" id="contents" name="contents"
						value="${bean.rec_content01}">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">2</span> <input type="text"
						class="recipe_text" id="contents" name="contents"
						value="${bean.rec_content02}">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">3</span> <input type="text"
						class="recipe_text" id="contents" name="contents"
						value="${bean.rec_content03}">
				</div>
			</div>
		</div>
		<div class="button">
			<button class="btn recipe_Update_button" type="submit"
				id="update_btn01">수정</button>
		</div>
	</section>
	<script>
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