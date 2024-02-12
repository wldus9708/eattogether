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
<style>
#rec_no, #rec_regdate{display : none; visibility:hidden;}
</style>
</head>
<body>
	<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="reUpdate">
		
		<div class="recipe_Update_title">
			<input type="text" class="recipe_Update_title02" id="rec_header"
				name="rec_header" placeholder="레시피 제목을 입력하세요" value="${bean.rec_header}">
		</div>
		
		<div id="rec_no" class="input-group mb-3">
				<span class="input-group-text">글번호</span> 
				<input type="text" class="form-control" id="fakeno" name="fakeno" value = "${bean.rec_no}" disabled="disabled">
				<input type="hidden" class="form-control" id="rec_no" name="rec_no" value = "${bean.rec_no}">
		</div>
		
		<div id="rec_regdate" class="input-group mb-3">
				<span class="input-group-text">업로드날짜</span> 
				<input type="text" class="form-control" id="fakeregdate" name="fakeregdate" value = "${bean.rec_regdate}" disabled="disabled">
				<input type="hidden" class="form-control" id="rec_regdate" name="rec_regdate" value = "${bean.rec_regdate}">
		</div>
		
		<div class="rec_file">
			<input type="file" id="image-input" name="rec_photo" accept="image/*"> 
			<img src="/eattogether/image/basicicon.png" id="image-preview" alt="사진">
			<input type="hidden" name="deleterec_photo" value="${bean.rec_photo}">
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
					<c:set var="categroyInfo" value="${bean.cat_no}"/>
						<option value="카테고리">--------카테고리를 선택해주세요.--------</option>
						<option value="1">양식</option>
						<option value="2">한식</option>
						<option value="3">중식</option>
						<option value="4">일식</option>
					</select>
				</div>
				<div class="recipe_Update_food-basic">
					<input type="text" class="recipe_text_basic" id="basic"
						name="rec_material" value="${bean.rec_material}">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">1</span> 
					<input type="text" class="recipe_text" id="content01" name="rec_content01"
						value="${bean.rec_content01}">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">2</span> 
					<input type="text" class="recipe_text" id="content02" name="rec_content02"
						value="${bean.rec_content02}">
				</div>
				<div class="recipe_Update_food-recipe">
					<span class="recipe_Update_food">3</span> 
					<input type="text" class="recipe_text" id="content03" name="rec_content03"
						value="${bean.rec_content03}">
				</div>
			</div>
		</div>
		<div class="button">
			<button class="btn recipe_Update_button" type="submit" id="update_btn01">수정하기</button>
		</div>
	</form>
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