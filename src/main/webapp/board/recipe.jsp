<%@page import="com.eattogether.utility.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipe_demo</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/eattogether/css/recipedetailStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="/eattogether/css/recipe.css">
	<style type="text/css">
	    #footer_butt {
        width: 180px;
        background-color: #FFCD1D;
        border-radius: 5px;
        margin-left: 10px;
        
    }

    #inquirybox {
        margin-top: 130px;
    }
    #inq_content{
    	border-radius: 5px;
    	margin-left: 10px;
        
    }
	</style>
<script>
    /* 필드 검색시 체크한 콤보 박스 상태 보존 */
    var optionList = $('#mode option');
    var atest=0;
    for(var i=0 ; i<optionList.length ; i++){
        if(optionList[i].value == '${requestScope.paging.mode}'){
            optionList[i].selected = true ;
        }
      
    }		

    /* 필드 검색시 입력한 keyword 내용 보존 */
   $(document).ready(function() {
	   
	  if('${requestScope.ww}'==1){
		  $('#keyword').val('${aa.alias}');
	  }else{
		  $('#keyword').val('${requestScope.paging.keyword}');
	  }
	  $('#mode').val('${requestScope.paging.mode}');
   
    // 다른 코드들도 여기에 추가할 수 있습니다.
});

    /* 상품 삭제 버튼 클릭 */
$(document).ready(function() {
    $('.recipe-sakgie').click(function() {

    	var rec_no = $(this).data('rec_no'); // .data()를 사용하여 데이터 속성을 가져옵니다
        console.log(rec_no);
        var response = confirm('해당 상품을 삭제하시겠습니까?');
        if (response) {
            var rec_no = $(this).data('rec_no'); // .data()를 사용하여 데이터 속성을 가져옵니다
            console.log(rec_no);
            var url = '<%=notWithFormTag%>reDelete${requestScope.paging.flowParameter}&rec_no='+rec_no;
            location.href = url;
        } else {
            alert('상품 삭제가 취소되었습니다.');
        }
    });
});

	function searchAll(){
	    location.href = '<%=notWithFormTag%>reList'	;
	}
	
	function writeForm(){
	    location.href = '<%=notWithFormTag%>reInsert';
	}
	
	
	$(".myImage").click(function() {
	    changeImg();
	});
	
	function changeImg() {
	    var imageElement = $(".myImage");
	
	    if (imageElement.attr('src').endsWith('/eattogether/image/emptystar.png')) {
	        imageElement.attr('src', '/eattogether/image/star.png');
	    } else {
	        imageElement.attr('src', '/eattogether/image/emptystar.png');
	    }
	}
	
</script>
<script>
		$(document).ready(function(){
		    $("#accordion").accordion({
		        collapsible: true,
		        active: false, // 초기에는 모든 아코디언이 닫혀있도록 설정
		        activate: function(event, ui) {
		            var index = $(this).accordion("option", "active");
		            sessionStorage.setItem('selectedAccordion', index);
		        }
		    });
		
		    var selectedAccordion = sessionStorage.getItem('selectedAccordion');
		    if (selectedAccordion !== null && selectedAccordion !== undefined) {
		        $("#accordion").accordion("option", "active", parseInt(selectedAccordion));
		    }
		
		    // 아코디언 버튼 클릭 이벤트 처리
		    $("#accordion h3").click(function() {
		        var index = $(this).index() / 2; // 클릭한 아코디언의 인덱스
		
		        // 클릭한 아코디언의 인덱스를 저장
		        sessionStorage.setItem('selectedAccordion', index);
		        
		        // 클릭한 아코디언이 이미 열려있는 경우에는 클릭 이벤트 중지
		        if ($(this).next("div").is(":visible")) {
		            return false;
		        }
		    });
		});
	</script>
</head>
<body>
	<br /> <br /> <br /> <br /> <br /> <br /> <br />
	<!-- 사이드바 부분 -->
	<aside class="recipe_sidebar">
		<div class="recipe_side0">
			<a href="<%=notWithFormTag%>reList&p=s"><p>레시피<p></a>
		</div>

		<div id="accordion">
			<h3>
				<a href=" ">양식</a>
			</h3>
			<ul>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=파스타&p=s">파스타</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=리조또&p=s">리조또</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=스테이크&p=s">스테이크</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=피자&p=s">피자</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=오믈렛&p=s">오믈렛</a></li>
			</ul>
			<h3>
				<a href=" ">한식</a>
			</h3>
			<ul>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=김치볶음밥&p=s">김치볶음밥</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=된장찌개&p=s">된장찌개</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=김치찌개&p=s">김치찌개</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=고등어&p=s">고등어조림</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=떡볶이&p=s">떡볶이</a></li>
			</ul>
			<h3>
				<a href=" ">중식</a>
			</h3>
			<ul>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=마라탕&p=s">마라탕</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=탕후루&p=s">탕후루</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=짬뽕&p=s">짬뽕</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=잡채밥&p=s">잡채밥</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=유린기&p=s">유린기</a></li>
			</ul>
			<h3>
				<a href=" ">일식</a>
			</h3>
			<ul>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=초밥&p=s">초밥</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=우동&p=s">우동</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=오코노미야끼&p=s">오코노미야키</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=가라아게&p=s">가라아게</a></li>
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=덴뿌라&p=s">덴뿌라</a></li>
			</ul>
		</div>
		<c:if test="${whologin eq 1 }">
				<form action="<%=withFormTag%>" method="post">
					<input type="hidden" name="command" value="inquInsert">
					<div id="inquirybox">
					<input type="hidden" id="mem_id" name="mem_id" value="${sessionScope.loginfo.id}">					
						<textarea id="inq_content" name="inq_content" rows="2" placeholder="문의사항 적는곳"></textarea>
						<button type="submit" id="footer_butt"
							onclick="return validCheck();">전송</button>
						<input type="hidden" id="inq_reply" name="inq_reply">
					</div>
				</form>
			</c:if>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
	</aside>
	
	<div class="container mt-3  ">
		<div class="row ">
			<!-- 최신순, 조회수 -->
			<div id="lastrecommend" style="display: flex; justify-content: flex-end;">
				<div class="recipe_latest">
					<a href="<%=notWithFormTag%>reList&p=s&mode=${requestScope.paging.mode}
						&keyword=${requestScope.paging.keyword}&rec_regdate=${bean.rec_regdate}">최신순
					</a>
				</div>
				<div class="recipe_re">
					<a href="<%=notWithFormTag%>reList&p=o&mode=${requestScope.paging.mode}
						&keyword=${requestScope.paging.keyword}&rec_hit=${bean.rec_hit}&pageNumber=${param.pageNumber}">조회수
					</a>
				</div>
			</div>
		<div class="col-sm-1 "></div>
		<div class="col-sm-10">
			<table class="table table-borderless">
				<tr>
					<td colspan="8" align="center">
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
							<!-- 레시피 게시물 -->
								<form action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="reList">
									<!-- 검색창 부분 -->
									<div class="row">
										<div class="col-sm-12">
											<select class="form-control-sm" id="mode" name="mode">
												<option value="all">--- 선택해주세요.
												<option value="mem_id">닉네임
												<option value="rec_header">레시피제목
												<option value="cat_no">음식카테고리
											</select> 
											<input class="form-control-sm" type="text" id="keyword" name="keyword">
											<button class="form-control-sm btn btn-warning"
												type="submit">검색</button>
												
											<button class="form-control-sm btn btn-warning"
												type="button" onclick="searchAll();">초기화</button>
												
											<c:if test="${whologin == 1 || whologin == 3}">
												<button class="form-control-sm btn btn-info" type="button" style="background:#ED6D35; border: none "
													onclick="location.href='<%=notWithFormTag%>reInsert';">글쓰기</button> &nbsp;&nbsp;
								            </c:if>
							            <!-- 총 몇건인지 나타내는 명령어 -->
										<span class="label label-default" id="recipe_result"> 
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
					<!-- 레시피 게시물 한개 -->
					<c:set var="columnSu" value="3" />
					<c:forEach var="bean" items="${requestScope.dataList}" varStatus="status">
						<c:if test="${status.index mod columnSu == 0}">
							<tr>
						</c:if>
						<td>
							<div class="card" style="width: 300px">
								<a class="removeUnderLine" 
									href="<%=notWithFormTag%>reDetail&rec_no=${bean.rec_no}&readhitUpdate=true">
									<img class="card-img-top" src="/eattogether/image/${bean.rec_photo}" alt="사진 이름">
								</a>
							<div class="card-body">
								<div class="card-body01">
									<a href="<%=notWithFormTag%>reDetail&rec_no=${bean.rec_no}&readhitUpdate=true" class="board_title">${bean.rec_header}</a>
								</div>
								<div class="card-body02">
									<a class="user-id"
										href="<%=notWithFormTag%>meDetail&rec_no=${bean.rec_no}">
									<img src="/eattogether/image/user.png" style="width: 45px"
										height="45px">${bean.alias}
									</a> 
									<a class="user-rocomend"
										href="<%=notWithFormTag%>reList&rec_hit=${bean.rec_hit}">
										${bean.rec_hit}&nbsp&nbsp
									<img src="/eattogether/image/eye3.png" style="width: 25px" height="25px">&nbsp
									</a>
								</div>
    							<div id="recipe_regdate">
        							등록일: ${bean.rec_regdate.substring(0, 10)}
    							</div>
									<c:if test="${whologin == 1 || whologin == 3}">
										<c:if test="${sessionScope.loginfo.id == bean.mem_id}">
											<div class="card-body03">
												<a id="updateAnchor" class="recipe-sujoung"
													href="<%=notWithFormTag%>reUpdate&rec_no=${bean.rec_no}${requestScope.paging.flowParameter}"> 수정 
												</a> 
												<a id="deleteAnchor_${bean.rec_no}"
													class="recipe-sakgie" href="<%=notWithFormTag%>reDelete&rec_no=${bean.rec_no}${requestScope.paging.flowParameter}" data-rec_no="${bean.rec_no}"> 삭제 
												</a>
											</div>
										</c:if>
									</c:if>
							</div>
							</div>
						</td>
						<c:if test="${status.index mod columnSu == (columnSu-1)}">
							</tr>
						</c:if>
					</c:forEach>
			</table>
			<br /> <br /> <br />
			<!-- 페이징 표현 -->
			${requestScope.paging.pagingHtml}
		</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>