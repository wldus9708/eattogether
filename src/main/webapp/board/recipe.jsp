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
<link rel="stylesheet" type="text/css" href="/eattogether/css/recipe.css">
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
				<h2>레시피 목록</h2>
					<p>레시피 목록이 보여지는 페이지 입니다.</p>
					<div id="lastrecommend" style="display:flex; justify-content:flex-end;">		  
						<div class="recipe_latest">최신순</div>
						<div class="recipe_re">추천순</div>
					</div>
				<div class="col-sm-1 "></div>
				<div class="col-sm-10">
				<table class="table table-borderless">
					<tr>
						<td colspan="8" align="center">
							<div class="row">
							   <div class="col-sm-1"></div>
							   <div class="col-sm-10">
							      <form action="<%=withFormTag%>" method="get">
							         <input type="hidden" name="command" value="prList">
							         <div class="row">
							            <div class="col-sm-12">
							               <select class="form-control-sm" id="mode" name="mode">
							                  <option value="all">--- 선택해주세요.
							                  <option value="name">작성자명
							                  <option value="recipe">레시피제목
							                  <option value="food">음식이름
							               </select>
							               <input class="form-control-sm" type="text" id="keyword" name="keyword">
								               <button class="form-control-sm btn btn-warning" type="submit">검색</button>
								               
								               <button class="form-control-sm btn btn-warning"
								               			type="button" onclick="searchAll();">전체 검색</button>
								               
								               <c:if test="${whologin == 2}">
													<button class="form-control-sm btn btn-info" type="button" 
														onclick="writeForm()">글쓰기</button>
								               </c:if>
								               
								               &nbsp;&nbsp;
							               <span class="label label-default">
							               	<!-- 총 몇건인지 나타내는 명령어 -->
							                  ${requestScope.paging.pagingStatus}
							               </span>
							            </div>                        
							         </div>                     
							      </form>
							   </div>
							   <div class="col-sm-1"></div>
							</div>
						</td>
					</tr>
					
					<tbody>
						
						<tr>
							<td>
								<div class="card" style="width: 300px">
									<div class="image-container">
										<a class="removeUnderLine"  href="recipeDetail.jsp"></a>
										<img class="card-img-top" src="./../image/steak_01.jpg" alt="스테이크01">
										<img id="myImage" class="overlay-image right-align" src="./../image/emptystar.png" onclick="changeImg()" alt="즐겨찾기">
									</div>
									<div class="card-body">
										<div class="card-body01">
											<a href="recipeDetail.jsp" class="board_title">제목</a>
										</div>
										<div class="card-body02">
											<a class="user-id" href=" ">
												<img src="/eattogether/image/user.png" style="width:45px" height="45px">(아이디)
											</a>
											<a class="user-rocomend" href="">
												(추천)<img src="/eattogether/image/likes.png" style="width:35px" height="35px">
											</a>
										</div>
										<div class="card-body03">
											<a id="sujoung" class="recipe-sujoung"  href=" ">
												수정
											</a>
											<a id="sakgie" class="recipe-sakgie" href="">
												삭제
											</a>
										</div>
									</div>
							</td>
							<td>
								<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="#">
								<img class="card-img-top" src="/eattogether/image/steak_02.jpg" alt="스테이크02">
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
								<img class="card-img-top" src="/eattogether/image/steak_03.jpg" alt="스테이크03">
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
								<img class="card-img-top" src="/eattogether/image/risotto_01.jpg" alt="리조또01">
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
								<img class="card-img-top" src="/eattogether/image/risotto_02.jpg" alt="리조또02">
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
								<img class="card-img-top" src="/eattogether/image/risotto_03.jpg" alt="리조또03">
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
								<img class="card-img-top" src="/eattogether/image/pizza_01.jpg" alt="피자01">
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
								<img class="card-img-top" src="/eattogether/image/pizza_02.jpg" alt="피자02">
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
								<img class="card-img-top" src="/eattogether/image/pizza_03.jpg" alt="피자03">
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