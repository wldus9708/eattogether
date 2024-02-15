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
<link rel="stylesheet" href="/eattogether/css/inquiryListStyle.css">
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
	location.href = '<%=notWithFormTag%>inquList';
	}
</script>
</head>
<body>
	<div id="contain">
		<c:if test="${whologin != 2 }">
			<div id="box1">
				<div class="recipe_side0">
					<h3 id="recipe">
						<a href="<%=notWithFormTag%>reList"><p>레시피</p></a>
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
				<input type="hidden" name="command" value="inquList">
				<div class="row">
					<div class="col-sm-12">
						<select class="form-control-sm" id="mode" name="mode">
							<option value="all">--- 선택해주세요.
							<option value="mem_id">아이디
							<option value="inq_content">문의내용
						</select> <input class="form-control-sm" type="text" id="keyword"
							name="keyword">
						<button class="form-control-sm btn btn-warning" type="submit">검색</button>

						<button class="form-control-sm btn btn-warning" type="button"
							onclick="searchAll();">전체 검색</button>
						&nbsp;&nbsp; <span class="label label-default">
							${requestScope.paging.pagingStatus} </span>
					</div>
				</div>
			</form>
			<table>

				<tbody>
					<c:forEach var="bean" items="${dataList}">
						<tr id="inq_header">
							<th style="width: 5%;" id="in-Information">${bean.inq_no}</th>
							<th style="width: 10%;" id="in-Information">${bean.inq_regdate}</th>
							<th style="width: 30%;" id="in-Information">${bean.mem_id}</th>
						</tr>
						<tr>
							<th colspan="3" style="width: 50%;" id="in-contents">${bean.inq_content}
							</th>
						</tr>
						<c:if test="${whologin eq 2 }">
							<tr>
								<td colspan="3">
									<div id="textAreaContainer">
										<textarea id="textBox" placeholder="답글다는곳"></textarea>
										<button id="sendButton">전송</button>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	${requestScope.paging.pagingHtml}
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>