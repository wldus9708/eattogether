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
	
$(document).ready(function(){			
	/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
	$('#comment_form').submit(function(){
		
		/* 입력한 댓글이 없으면 전송이 불가능합니다. */
		if(!$('#inq_reply').val()){
			alert('댓글을 반드시 입력해 주세요.');
			$('#inq_reply').focus();
			return false;
		}
		
		/* submit 버튼의 캡션 정보 가져 오기 */
		var caption = $('#sendButton').text();
		/* alert(caption); */
		
		if(caption=='저장하기'){
			/* jQuery의 Ajax 기능 중에서 post 방식을 이용하여 데이터를 전송합니다. */
			
			var URL = '<%=notWithFormTag%>inquComment';

				// 명시된 폼 양식 내의 모든 파라미터를 인코딩이 적용된 문자열을 만들어 줍니다.
				var data = $('#comment_form').serialize();

				$.post(URL, data, function(data, status, xhr) {
					$('#inq_reply').val(''); /* 입력한 글자 지우기 */
					return true;
				}).fail(function() {
					alert('댓글 작성에 실패하였습니다.')
					return false;
				});

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
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=고등어&p=s">고등어</a></li>
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
						<c:forEach var="test" items="${testinq}" varStatus="status">
							<tr>									
							</tr>
							<c:if test="${test.getInq_groupno()==bean.getInq_groupno()}">
								<tr>					
							<td>답글 : ${test.inq_reply}</td>
								</tr>
							</c:if>
						</c:forEach>
						<form action="<%=withFormTag%>" id="comment_form" method="post" role="form"
							class="form-horizontal" >
							<input type="hidden" name="command" value="inquComment">
							<c:if test="${whologin eq 2 }">
								<tr>
									<td><input type="hidden" id="inq_no" name="inq_no"
										value="${bean.inq_no}" /> 
										<input type="hidden" name="mem_id"
										id="mem_id" class="form-control" size="10"
										value="${sessionScope.loginfo.id}">
										<input type="hidden" name="inq_content" id="inq_content"
										value="${bean.inq_content}">
										<input type="hidden" name="inq_regdate" id="inq_regdate"
										value="${bean.inq_content}">
										<input type="text" name="inq_groupno"
										id="inq_groupno" class="form-control"
										value="${bean.inq_groupno}">
										</td>
								</tr>

								<tr>
									<!-- <td ><label for="contents"
									class="col-xs-3 col-lg-3 control-label">댓글 내용</label></td> -->
									<td colspan="2" style="width: 80%;">
										<!-- <textarea id="inq_content" name="inq_content" placeholder="답글다는곳"> </textarea>-->
										<div id="textAreaContainer">
											<textarea id=inq_reply name="inq_reply"
												placeholder="답글다는곳" cols="150"></textarea>
												<input type="hidden" id="inq_orderno" name="inq_orderno" value="${bean.inq_orderno}">
										</div>
									</td>
									<td style="width: 20%;">
									<button type="submit" id="sendButton">전송</button>
									</td>
								</tr>
							</c:if>
						</form>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	${requestScope.paging.pagingHtml}
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>