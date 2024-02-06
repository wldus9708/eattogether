<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/eattogether/css/mangernotiListStyle.css">
<script type="text/javascript">
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
		location.href = '<%=notWithFormTag%>boList'	;
	}
	
	function writeForm(){ /* 게시물 작성  */
		location.href = '<%=notWithFormTag%>boInsert' ;
	}
	
	function deleteBoard(no, paramList){ /* 게시물 삭제  */
		/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
		
		var response = window.confirm('해당 게시물을 삭제하시겠습니까?');
		
		if(response==true){
			var url = '<%=notWithFormTag%>boDelete&no=' + no + paramList;
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
		<div id="box2">
			<form action="<%=withFormTag%>" method="get">
				<input type="hidden" name="command" value="mangernotiLis">
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

						<button class="form-control-sm btn btn-info" type="button"
							onclick="writeForm();">글쓰기</button>

						&nbsp;&nbsp; <span class="label label-default">
							${requestScope.paging.pagingStatus} </span>
					</div>
				</div>
			</form>
			<section class="inquiries">
				<h2>공지사항</h2>
				<c:forEach var="bean" items="${dataList}">
					<ul id="inquiryList">
						<li><a href="#" class="toggleInquiry" >${bean.not_header} </a>

							<div class="inquiryDetails">
								<div id="manger_contents">
									<p>${bean.not_content}</p>
								</div>
								<div id="manger_modify">
									<button
										href="<%=notWithFormTag%>notiUpdate&not_no=${bean.not_no}${requestScope.paging.flowParameter}"
										id="editInquiry">수정하기</button>
									<button id="deleteButton" data="${bean.not_no}">삭제하기</button>
								</div>
							</div></li>
					</ul>
				</c:forEach>
			</section>

		</div>

		${requestScope.paging.pagingHtml}
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
</html>
<%@include file="./../common/mangerfooter.jsp"%>