<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/eattogether/css/mangerListStyle.css">
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
	location.href = '<%=notWithFormTag%>manList'	;
}

function deleteNotice(mem_id, paramList){ /* 게시물 삭제  */
	/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
	
	var response = window.confirm('해당 회원을 삭제하시겠습니까?');
	
	if(response==true){
		var url = '<%=notWithFormTag%>manDelete&mem_id=' + mem_id+ paramList;
			/* alert(url); */
			location.href = url;

		} else {
			alert('게시물 삭제가 취소되었습니다.');
			return false;
		}
	}
</script>
<style type="text/css">
#mode {
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<div id="contain">
		<div id="box2">
			<form action="<%=withFormTag%>" method="get">
				<input type="hidden" name="command" value="manList">
				<div class="row">
					<div class="col-sm-12">
						<select class="form-control-sm" id="mode" name="mode">
							<option value="all">--- 선택해주세요.
							<option value="subject">아이디
							<option value="contents">이름
							<option value="contents">닉네임
							<option value="contents">전화번호
							<option value="contents">사용자유형
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
			<div class="manger_member">
				<table id="man_search">
					<tr>
						<td style="width: 10%">아이디</td>
						<td style="width: 10%">이름</td>
						<td style="width: 10%">닉네임</td>
						<td style="width: 10%">생일</td>
						<td style="width: 10%">전화</td>
						<td style="width: 10%">취향</td>
						<td style="width: 10%">회원유형</td>
						<td style="width: 10%">삭제</td>
					</tr>
					<c:forEach var="bean" items="${dataList}">
					<tr>
						<td>${bean.id}</td>
						<td>${bean.name}</td>
						<td>${bean.alias}</td>
						<td>${bean.birth}</td>
						<td>${bean.phone}</td>
						<td>${bean.taste}</td>
						<td>${bean.flag}</td>
						<td>
							<a href="#" id="deleteButton"
								onclick="return deleteNotice('${bean.id}', '${requestScope.paging.flowParameter}');">삭제</a>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>

		</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>