<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/eattogether/css/mangernotiListStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
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
	});

	function searchAll(){ /* 전체 검색  */
		location.href = '<%=notWithFormTag%>noList'	;
	}
	
	function writeForm(){ /* 게시물 작성  */
		location.href = '<%=notWithFormTag%>notiInsert' ;
	}
	
	function deleteNotice(no, paramList){ /* 게시물 삭제  */
		/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
		
		var response = window.confirm('해당 게시물을 삭제하시겠습니까?');
		
		if(response==true){
			var url = '<%=notWithFormTag%>notiDelete&no=' + no + paramList;
			/* alert(url); */
			location.href = url ;
		
		}else{
			alert('게시물 삭제가 취소되었습니다.');
			return false ;
		}
	}
</script>
</head>
<body>
	<div id="contain">
		<c:if test="${whologin != 2 }">
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
		</c:if>
		<div id="box2">
			<form action="<%=withFormTag%>" method="get">
				<input type="hidden" name="command" value="mangernotiList">
				<div class="row">
					<div class="col-sm-12">
						<select class="form-control-sm" id="mode" name="mode">
							<option value="all">--- 선택해주세요.
							<option value="subject">글제목
							<option value="contents">글내용
						</select> <input class="form-control-sm" type="text" id="keyword"
							name="keyword">

						<button class="form-control-sm btn btn-warning" type="submit">검색</button>

						<button class="form-control-sm btn btn-warning" type="button"
							onclick="searchAll();">전체 검색</button>
						<c:if test="${whologin == 2 }">
							<button class="form-control-sm btn btn-info" type="button"
								onclick="writeForm();">글쓰기</button>
						</c:if>
						&nbsp;&nbsp; <span class="label label-default">
							${requestScope.paging.pagingStatus} </span>
					</div>
				</div>
			</form>
			<section class="inquiries">
				<h2>공지사항</h2>
				<c:forEach var="bean" items="${dataList}">
					<ul id="inquiryList">
						<li><a href="#" class="toggleInquiry">${bean.not_header}
						</a>

							<div class="inquiryDetails">
								<div id="manger_contents">
									<p>${bean.not_content}</p>
								</div>
								<c:if test="${whologin == 2 }">
									<div id="manger_modify">
										<a type="button"
											href="<%=notWithFormTag%>notiUpdate&not_no=${bean.not_no}${requestScope.paging.flowParameter}"
											id="editInquiry">수정하기</a> <a type="button" id="deleteButton"
											data="${bean.not_no}">삭제하기</a>
									</div>
								</c:if>
							</div></li>
					</ul>
				</c:forEach>
			</section>

		</div>
	</div>
	${requestScope.paging.pagingHtml}
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
</html>
<%@include file="./../common/mangerfooter.jsp"%>