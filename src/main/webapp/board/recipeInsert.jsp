<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/eattogether/css/recipeInsert.css">
<script>
	// 파일 입력(input) 엘리먼트
    const imageInput = document.getElementById('image-input');

    // 이미지 미리보기를 나타낼 이미지 엘리먼트
    const imagePreview = document.getElementById('image-preview');

    // 파일 입력이 변경될 때 이벤트 처리
    imageInput.addEventListener('change', function (event) {
        // 선택한 파일 가져오기
        const file = event.target.files[0];

        // 파일이 존재하면
        if (file) {
            // 파일을 읽기 위한 FileReader 객체 생성
            const reader = new FileReader();

            // 파일 읽기가 완료되었을 때의 이벤트 처리
            reader.onload = function (e) {
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
</head>
<body>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
				<h2>상품 등록</h2>
				<p>관리자가 구매할 상품을 등록하는 페이지입니다.</p>
				<form action="<%=withFormTag%>" method="post" 
					enctype="multipart/form-data">
					<input type="hidden" name="command" value="prInsert">
					<div id="productPnum" class="input-group">
						<span class="input-group-text">상품 번호</span> <input
							class="form-control" type="number" id="pnum" name="pnum">
					</div>
					<div class="input-group">
						<span class="input-group-text">상품 이름</span> 
						<input class="form-control" type="text" id="name" name="name" placeholder="레시피 제목을 입력하세요">
					</div>
					<div>
						<input type="file" id="image-input" accept="image/*">
			    		<img src="/eattogether/image/basicicon.png" id="image-preview" alt="사진">
					</div>
					<div class="input-group">
						<span class="input-group-text">카테고리</span> 
						<select id="category" name="category" class="form-select">
							<c:forEach var="category" items="${requestScope.categories}">
								<option value="${category.cat_name}">${category.cat_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group">
						<span class="input-group-text">레시피</span> 
						<textarea id="contents" name="contents" rows="3" cols="50">
					</div>
					<div id="buttonset" class="input-group">
						<button type="submit" class="btn btn-primary btn-lg"
							onclick="return validCheck();">등록하기</button>
						&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-secondary btn-lg">수정하기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>
<%@ include file="./../common/footer.jsp"%>