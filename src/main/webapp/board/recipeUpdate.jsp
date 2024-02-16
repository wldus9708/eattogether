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
#rec_no, #rec_regdate {
	display: none;
	visibility: hidden;
}
</style>
<script type="text/javascript">
  		$(document).ready(function(){ 
  			/* 이전에 선택했던 카테고리 정보가 자동으로 선택되어 있도록 합니다. */
 	        var category = '${bean.cat_no}';
    
		    var optionList = $('#cat_no option');
		    optionList.each(function(){
		        console.log($(this).val());
		        if ($(this).val() === category) {
		            $(this).prop('selected', true);
	            }
	         }); 
  		}
  		
  		function validCheck(){
  			var rec_header = $('#rec_header').val();
  			if(rec_header.length < 4 || rec_header.length > 30){
  				alert('상품명은 4글자 이상 30글자 이하이어야 합니다.');
  				$('#rec_header').focus() ;
  				return false ;
  			}
  			var cat_no = $('#cat_no').val();
  			if(cat_no == '-'){ /* 코딩할 때 option의 value 속성을 하이폰으로 설정했습니다. */
  				alert('카테고리를 선택해 주세요.');
	  			$('#cat_no').focus();
	  			return false ;
  			}  
  		}
</script>
</head>
<body>
	<form action="<%=withFormTag%>" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="command" value="reUpdate">

		<div class="recipe_Update_title">
			<input type="text" class="recipe_Update_title02" id="rec_header"
				name="rec_header" placeholder="레시피 제목을 입력하세요"
				value="${bean.rec_header}">
		</div>

		<div id="rec_no" class="input-group mb-3">
			<span class="input-group-text">글번호</span> <input type="text"
				class="form-control" id="fakeno" name="fakeno"
				value="${bean.rec_no}" disabled="disabled"> <input
				type="hidden" class="form-control" id="rec_no" name="rec_no"
				value="${bean.rec_no}">
		</div>

		<div id="rec_regdate" class="input-group mb-3">
			<span class="input-group-text">업로드날짜</span> <input type="text"
				class="form-control" id="fakeregdate" name="fakeregdate"
				value="${bean.rec_regdate}" disabled="disabled"> <input
				type="hidden" class="form-control" id="rec_regdate"
				name="rec_regdate" value="${bean.rec_regdate}">
		</div>

		<div class="rec_file">
			<input type="file" id="image-input" name="rec_photo" accept="image/*">
			<img src="/eattogether/image/${bean.rec_photo}" id="image-preview"
				alt="사진"> <input type="hidden" name="deleterec_photo"
				value="${bean.rec_photo}">
		</div>
		<div class="row">
			<div class="col-sm-3">
				<div class="recipe_Update_food-basic">
					<div class="recipe_Update_food-name">작성자 :</div>
					<div class="recipe_Update_food-name">카테고리 :</div>
					<div class="recipe_Update_food-name">재료 :</div>
					<div class="recipe_Update_food-name">레시피 :</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="recipe_Update_food-basic">
					<c:set var="userInfo"
						value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})" />
					<input type="text" class="form-control" id="fakeid" name="fakeid"
						value="${userInfo}" disabled="disabled"> <input
						type="hidden" id="id" name="mem_id"
						value="${sessionScope.loginfo.id}">
				</div>
				<div class="recipe_Update_food-basic">
					
					<%-- <select id="cat_no" name="categroy" class="recipe_text_basic">
						<c:set var="cat_no" value="${bean.cat_no}"/>
						<option value="-">--------카테고리를 선택해주세요.--------</option>
						<option value="1">양식</option>
						<option value="2">한식</option>
						<option value="3">중식</option>
						<option value="4">일식</option>
					</select> --%>
					<select id="cat_no" name="cat_no" class="recipe_text_basic">
					  <c:set var="selectedValue" value="${bean.cat_no}" />
					  <option value="-">--------카테고리를 선택해주세요.--------</option>
					  <option value="1" ${selectedValue eq '1' ? 'selected' : ''}>양식</option>
					  <option value="2" ${selectedValue eq '2' ? 'selected' : ''}>한식</option>
					  <option value="3" ${selectedValue eq '3' ? 'selected' : ''}>중식</option>
					  <option value="4" ${selectedValue eq '4' ? 'selected' : ''}>일식</option>
					</select>
				</div>
				
				<div class="recipe_Update_food-basic">
					<input type="text" class="recipe_text_basic" id="basic"
						name="rec_material" value="${bean.rec_material}">
				</div>
				<div id="recipeFields">
					<!-- 데이터베이스에서 가져온 텍스트 인풋 필드들이 여기에 동적으로 생성됩니다 -->
					<%-- Recipe 내용 입력 필드 --%>
					<c:forEach var="content" items="${bean.rec_contents}"
						varStatus="loop">
						<div class="recipe_Update_food-recipe" style="display: flex">
							<span class="recipe_Update_food" style="margin-right: 10px;">${loop.index + 1}</span>
							<input type="text" class="recipe_text" name="rec_content[]"
								value="${content}" style="margin-right: 10px;">
							<button type="button" class="btn btn-danger remove-field">X</button>
						</div>
					</c:forEach>

					<button type="button" class="btn" id="add-recipe">추가</button>
				</div>
			</div>
		</div>

		<div class="button">
			<button class="btn recipe_Update_button" type="submit"
				id="update_btn01" onclick="return validCheck();">수정</button>
		</div>
	</form>
	<script>
		document.addEventListener('DOMContentLoaded',
				function() {
					var recipeFieldsContainer = document
							.getElementById('recipeFields');
					var recipeContents = $
					{
						bean.recipeContents
					}
					; // 데이터베이스에서 가져온 레시피 내용 배열

					// 데이터베이스에서 가져온 텍스트 인풋 필드의 수만큼 필드를 생성합니다
					recipeContents.forEach(function(content, index) {
						var newDiv = document.createElement('div');
						newDiv.className = 'recipe_Update_food-recipe';

						var newSpan = document.createElement('span');
						newSpan.className = 'recipe_Update_food';
						newSpan.textContent = index + 1;
						newDiv.appendChild(newSpan);

						var newInput = document.createElement('input');
						newInput.type = 'text';
						newInput.className = 'recipe_text';
						newInput.name = 'rec_content[]'; // 배열 형태로 이름 지정
						newInput.value = content; // 데이터베이스에서 가져온 값으로 설정
						newDiv.appendChild(newInput);

						var removeButton = document.createElement('button');
						removeButton.type = 'button';
						removeButton.className = 'btn btn-danger remove-field';
						removeButton.textContent = 'X';
						newDiv.appendChild(removeButton);

						recipeFieldsContainer.appendChild(newDiv);
					});

					// 가로 배치를 위해 요소들을 조정합니다
					adjustLayout();
				});

		function adjustLayout() {
			var recipeUpdateFoodRecipe = document
					.querySelectorAll('.recipe_Update_food-recipe');
			recipeUpdateFoodRecipe.forEach(function(item) {
				var span = item.querySelector('.recipe_Update_food');
				var input = item.querySelector('.recipe_text');
				var button = item.querySelector('.remove-field');

				// 숫자, 텍스트 입력 필드, X 버튼을 가로로 배치합니다
				span.style.display = 'inline-block';
				input.style.display = 'inline-block';
				button.style.display = 'inline-block';
				button.style.marginLeft = '10px'; // X 버튼과 다음 요소 사이의 간격을 조정합니다
			});
		}

		document.addEventListener('DOMContentLoaded', function() {
			var removeButtons = document.querySelectorAll('.remove-field');
			removeButtons.forEach(function(button) {
				button.addEventListener('click', function(event) {
					var parentElement = event.target.parentNode; // 삭제할 요소의 부모 요소를 가져옵니다.
					parentElement.remove(); // 부모 요소를 삭제합니다.
					adjustIndexes(); // 인덱스를 조정합니다.
				});
			});
		});

		function adjustIndexes() {
			var recipeUpdateFoodRecipe = document
					.querySelectorAll('.recipe_Update_food-recipe');
			recipeUpdateFoodRecipe.forEach(function(item, index) {
				var span = item.querySelector('.recipe_Update_food');
				span.textContent = index + 1;
			});
		}

		document.addEventListener('DOMContentLoaded', function() {
			var addButton = document.getElementById('add-recipe');
			addButton.addEventListener('click', function() {
				var recipeUpdateFoodRecipe = document
						.getElementsByClassName('recipe_Update_food-recipe');
				if (recipeUpdateFoodRecipe.length >= 10) {
					alert('최대 10개의 입력 필드만 추가할 수 있습니다.');
					return;
				}
				var newDiv = document.createElement('div');
				newDiv.className = 'recipe_Update_food-recipe';

				var newContainer = document.createElement('div'); // 텍스트와 x 버튼을 감싸는 컨테이너 추가
				newContainer.style.display = 'flex'; // 가로로 배치하기 위해 Flexbox 사용
				newContainer.style.alignItems = 'center'; // 요소들을 세로 중앙 정렬

				var newSpan = document.createElement('span');
				newSpan.className = 'recipe_Update_food';
				newSpan.textContent = recipeUpdateFoodRecipe.length + 1;
				newContainer.appendChild(newSpan);

				var newInput = document.createElement('input');
				newInput.type = 'text';
				newInput.className = 'recipe_text';
				newInput.name = 'rec_content[]';
				newContainer.appendChild(newInput);

				var removeButton = document.createElement('button');
				removeButton.type = 'button';
				removeButton.className = 'btn btn-danger remove-field';
				removeButton.textContent = 'X';
				removeButton.addEventListener('click', function(event) {
					var parentElement = event.target.parentNode.parentNode; // 텍스트 입력 필드와 삭제 버튼을 감싸는 부모 요소
					parentElement.remove(); // 텍스트 입력 필드를 포함하는 부모 요소를 삭제
					adjustIndexes(); // 인덱스를 조정합니다.
				});
				newContainer.appendChild(removeButton);

				newDiv.appendChild(newContainer); // 컨테이너를 새로운 div에 추가

				document.getElementById('add-recipe').parentNode.insertBefore(
						newDiv, addButton);
				adjustIndexes(); // 인덱스를 조정합니다.
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
<%@include file="./../common/mangerfooter.jsp"%>