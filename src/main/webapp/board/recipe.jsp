<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>recipe_demo</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="../css/recipe_demo.css">
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
	<br/><br/><br/><br/><br/><br/><br/>
	<aside class="recipe_sidebar">
	
        <div class="recipe_side0">
            <h3 id="recipe"><p>레시피</p></h3>
        </div>
		
		<div id="accordion">
            <h3><a href="#">양식</a></h3>
            <ul>
                <li><a href="#">파스타</a></li>
                <li><a href="#">리조또</a></li>
                <li><a href="#">스테이크</a></li>
                <li><a href="#">피자</a></li>
                <li><a href="#">오믈렛</a></li>
            </ul>
        
            <h3><a href="#">한식</a></h3>
            <ul>
                <li><a href="#">김치볶음밥</a></li>
                <li><a href="#">된장찌개</a></li>
                <li><a href="#">김치찌개</a></li>
                <li><a href="#">고등어조림</a></li>
                <li><a href="#">고추장삼겹살</a></li>
            </ul>
        
            <h3><a href="#">중식</a></h3>
            <ul>
                <li><a href="#">마라탕</a></li>
                <li><a href="#">탕후루</a></li>
                <li><a href="#">짬뽕</a></li>
                <li><a href="#">잡채밥</a></li>
                <li><a href="#">유린기</a></li>
            </ul>
        
            <h3><a href="#">일식</a></h3>
            <ul>
                <li><a href="#">초밥</a></li>
                <li><a href="#">호토마키</a></li>
                <li><a href="#">우동</a></li>
                <li><a href="#">가라아게</a></li>
                <li><a href="#">덴뿌라</a></li>
            </ul>
        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    </aside>
    
    
    <div class="container mt-3  ">
		<div class="row ">
				<div class="col-sm-1 "></div>
				<div class="col-sm-10">
				<h2>레시피 목록</h2>
				<p>레시피 목록이 보여지는 페이지 입니다.</p>
				
				<table class="table table-borderless">
					<thead> 
						<div id="inner-grid">
							  <div class="recipe_count">총 ( )개의 래시피가 있습니다.</div>				  
							  <div class="recipe_latest">최신순</div>
							  <div class="recipe_re">추천순</div>
						</div>
					</thead>
					
					<tbody>
						
						<tr>
							<td>
								<div class="card" style="width: 300px">
									<div class="image-container">
										<a class="removeUnderLine"  href="#"></a>
										<img class="card-img-top" src="./../image/steak_01.jpg" alt="스테이크01">
										<img id="myImage" class="overlay-image right-align" src="./../image/emptystar.png" onclick="changeImg()" alt="즐겨찾기">
									</div>
									<div class="card-body">
									<h4 class="card-title">
									<span>
										<a href="recipeDetail_demo.jsp" class="btn btn-primary">제목</a>
									</span>
									</h4>
									<p class="card-text">
									<a href="#" class="btn btn-primary">아이디</a>
									</p>
									</div>
								
								</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/steak_02.jpg" alt="스테이크02">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/steak_03.jpg" alt="스테이크03">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
						</tr>
						<br/><br/>
						<tr>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/risotto_01.jpg" alt="리조또01">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/risotto_02.jpg" alt="리조또02">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/risotto_03.jpg" alt="리조또03">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
						</tr>
						<br/><br/>
						<tr>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/pizza_01.jpg" alt="피자01">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/pizza_02.jpg" alt="피자02">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="./../image/pizza_03.jpg" alt="피자03">
								<div class="card-body">
								<h4 class="card-title">
								<span>
									<a href="#" class="btn btn-primary">제목</a>
								</span>
								</h4>
								<p class="card-text">
								<a href="#" class="btn btn-primary">아이디</a>
								</p>
								</div>
								</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div> 
</body>
</html>
<%@ include file="./../common/footer.jsp"%>