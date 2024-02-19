<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/eattogether/css/notiListStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style type="text/css">
#footer_butt {
	width: 160px;
	background-color: #FFCD1D;
}

#inquirybox {
	margin-top: 130px;
}
</style>
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
		location.href = '<%=notWithFormTag%>notiList'	;
	}
	
	function writeForm(){ /* 게시물 작성  */
		location.href = '<%=notWithFormTag%>notiInsert' ;
	}
	
	function deleteNotice(noti_no, paramList){ /* 게시물 삭제  */
		/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
		
		var response = window.confirm('해당 게시물을 삭제하시겠습니까?');
		
		if(response==true){
			var url = '<%=notWithFormTag%>notiDelete&noti_no=' + noti_no + paramList;
			/* alert(url); */
			location.href = url ;
		
		}else{
			alert('게시물 삭제가 취소되었습니다.');
			return false ;
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
	<div id="contain">
		<c:if test="${whologin != 2 }">
			<div id="box1">
				<div class="recipe_side0">
					<h3 id="recipe">
						<a href="<%=notWithFormTag%>reList&p=s"><p>레시피</p></a>
					</h3>
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
			</div>
		</c:if>
		<div id="box2">
			<form action="<%=withFormTag%>" method="get">
				<input type="hidden" name="command" value="notiList">
				<div class="row">
					<div class="col-sm-12">
						<select class="form-control-sm" id="mode" name="mode">
							<option value="all">--- 선택해주세요.
							<option value="noti_header">글제목
							<option value="noti_content">글내용
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
						<li><a href="#" class="toggleInquiry">${bean.noti_header}
						</a>

							<div class="inquiryDetails">
								<div id="manger_contents">
									<p>${bean.noti_content}</p>
								</div>
								<c:if test="${whologin == 2 }">
									<div id="manger_modify">
										<a type="button"
											href="<%=notWithFormTag%>notiUpdate&noti_no=${bean.noti_no}${requestScope.paging.flowParameter}"
											id="editInquiry">수정하기</a> 
											<a href="#"  id="deleteButton"
								onclick="return deleteNotice('${bean.noti_no}', '${requestScope.paging.flowParameter}');">삭제</a>
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