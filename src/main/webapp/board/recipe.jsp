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
$(document).ready(function(){
		/* 필드 검색시 체크한 콤보 박스 상태 보존 */
		var optionList = $('#mode option');/* 옵션 목록 */
		for(var i=0 ; i<optionList.length ; i++){
			if(optionList[i].value == '${requestScope.paging.mode}'){
				optionList[i].selected = true ;
			}
		}		
		
		/* 필드 검색시 입력한 keyword 내용 보존 */
		$('#keyword').val('${requestScope.paging.keyword}');
		
		/* 상품 삭제 버튼 클릭 */
		/* id 속성이 "deleteAnchor"로 시작하는 항목을 찾아서 */
		$('[id^=deleteAnchor]').click(function(){
			var response = confirm('해당 상품을 삭제하시겠습니까?');
			if(response==true){				
				var rec_no = $(this).attr('data') ; /* 상품 번호 */
				
				var url = '<%=notWithFormTag%>reDelete${requestScope.paging.flowParameter}&rec_no=' + rec_no ;
				
				location.href = url ;
				
			}else{
				alert('상품 삭제가 취소되었습니다.') ;
			}
		});
	});

	function searchAll(){
		location.href = '<%=notWithFormTag%>reList'	;
	}
	
	function writeForm(){
		location.href = '<%=notWithFormTag%>reInsert';
	}

$(function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  });
  
  function changeImg() {
	  var imageElement = $("#myImage");
	  
  
  		if (imageElement.attr('src').endsWith('eattogether/image/emptystar.png')) {
	    imageElement.attr('src', 'eattogether/image/star.png');
	  } else {
	    imageElement.attr('src', 'eattogether/image/emptystar.png');
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
								         <input type="hidden" name="command" value="reList">
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
								               			<c:if test="${whologin == 1 }">
													<button class="form-control-sm btn btn-info" type="button" 
														onclick="writeForm()">글쓰기</button>
									               &nbsp;&nbsp;
									               </c:if>
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
					<c:set var="columnSu" value="3" />
					<c:forEach var="bean" items="${requestScope.dataList}" varStatus="status">
					<c:if test="${status.index mod columnSu == 0}">
						<tr>
					</c:if>
						<td>
							<div class="card" style="width: 300px">
								<a class="removeUnderLine"  href="<%=notWithFormTag%>reDetail&rec_no=${bean.rec_no}">
								<img class="card-img-top" src="/eattogether/image/${bean.rec_photo}" alt="사진 이름">
								<img id="myImage" class="overlay-image right-align" src="/eattogether/image/emptystar.png" onclick="changeImg()" alt="즐겨찾기">
								<div class="card-body">
									<div class="card-body01">
										<a href="recipeDetail.jsp" class="board_title">${bean.rec_header}</a>
									</div>
									<div class="card-body02">
										<a class="user-id" href=" ">
											<img src="/eattogether/image/user.png" style="width:45px" height="45px">${bean.mem_id}
										</a>
										<a class="user-rocomend" href="">
											${bean.rec_popularity}<img src="/eattogether/image/likes.png" style="width:35px" height="35px">
										</a>
									</div>
									<c:if test="${whologin == 1 }">
									<c:if test="${sessionScope.loginfo.id == bean.mem_id}">
									<div class="card-body03">
										<a id="updateAnchor" class="recipe-sujoung"  href="<%=notWithFormTag%>reUpdate&rec_no=${bean.rec_no}${requestScope.paging.flowParameter}">
											수정
										</a>
										<a id="deleteAnchor_${bean.rec_no}" class="recipe-sakgie" data="${bean.rec_no}">
											삭제
										</a>
									</div>
									</c:if>
									</c:if>
									</div>
									</a>
								</div>
						</td>
					<c:if test="${status.index mod columnSu == (columnSu-1)}">
					</tr>
					</c:if>
					</c:forEach>
				</table>
				<!-- 페이징 표현 -->
				${requestScope.paging.pagingHtml}
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div> 
</body>
</html>
<%@ include file="./../common/footer.jsp"%>