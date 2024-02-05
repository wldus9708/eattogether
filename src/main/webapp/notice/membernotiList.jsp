<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/eattogether/css/membernotiListStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
	<div id="contain">
		<div id="box1">
			<div class="recipe_side0">
				<h3 id="recipe">
					<p>레시피</p>
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
					<li><a href="#">고추장삼겹살</a></li>
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
		<div id="box2">
			<section class="inquiries">
				<h2>공지사항</h2>
				<ul id="inquiryList">
					<li><a href="#"
						class="toggleInquiry">공지사항</a>
						<div class="inquiryDetails">
							<div id="manger_contents">
								<p>서비스향상을위해 전체적으로업데이트가 있을예정입니다.</p>
							</div>
						</div></li>
				</ul>
			</section>
		</div>
	</div>
</body>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    const toggleButtons = document.querySelectorAll(".toggleInquiry");

    toggleButtons.forEach(button => {
        button.addEventListener("click", function () {
            const details = this.nextElementSibling; // 다음 형제 요소인 .inquiryDetails 선택
            const allDetails = document.querySelectorAll(".inquiryDetails");

            // 다른 모든 토글 닫기
            allDetails.forEach(item => {
                if (item !== details) {
                    item.style.display = "none";
                }
            });

            // 현재 토글 열기/닫기
            if (details.style.display === "none" || details.style.display === "") {
                details.style.display = "block";
            } else {
                details.style.display = "none";
            }
        });
    });
});
</script>
<%@include file="./../common/footer.jsp"%>
</html>