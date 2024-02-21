<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/eattogether/css/submypage2.css">
<style>
</style>
</head>
<body>
	<div id="submypage_entir">
		<div id="submypage_contain01">
			<div id="submypage_box01">
				<div class="custom-shape" id="submyicon">
					<img src="/eattogether/image/${mbean.picture }" id="submypage_icon">
				</div>
			</div>
			<div id="submypage_box02">
				<table id="submypage_Input">
					<td id="submyname" style="width: 25%">이름</td>
					<td><span>${mbean.name}</span></td>
					<tr>
					<tr>
						<td id="submyid" style="width: 25%">닉네임</td>
						<td><span>${mbean.alias}</span></td>
					<tr>
					<tr>
						<td id="submyfood" style="width: 25%">음식취향</td>
						<td><span>${mbean.taste}</span></td>
					<tr>
					<tr>
						<td id="submybirth" style="width: 25%">생일</td>
						<td><span>${mbean.birth}</span></td>
					<tr>
				</table>
			</div>
		</div>

		<div id="submypage_contain02">
			<div class="submypage_Bookmark01">
				<div>내가 만든 레시피</div>
			</div>
			<div class="submypage_Bookmark02">
				<c:set var="itemsPerPage1" value="4" />
				<c:set var="currentPage1"
					value="${empty param.page1 ? 1 : param.page1}" />
				<c:set var="startIdx1" value="${(currentPage1 - 1) * itemsPerPage1}" />
				<c:set var="endIdx1" value="${startIdx1 + itemsPerPage1 - 1}" />

				<c:forEach var="item" items="${cdataList}" varStatus="loopStatus"
					begin="${startIdx1}" end="${endIdx1}">

					<a href="<%=notWithFormTag%>reDetail&rec_no=${item.rec_no}"> <img
						src="/eattogether/image/${item.rec_photo}" class="subima">
					</a>
				</c:forEach>

				<!-- 부트스트랩 페이징 -->
				<ul class="pagination pagination-sm justify-content-center">
					<c:set var="totalPages1"
						value="${cdataList.size() + itemsPerPage1 - 1/itemsPerPage1}" />
					<c:if test="${currentPage1 > 1}">
						<li class="page-item"><a class="page-link"
							href="<%=notWithFormTag%>meList&id=${sessionScope.loginfo.id}&page1=${currentPage1 - 1}">Previous</a></li>
					</c:if>
					<!-- 여기가 문제 -->
					<c:forEach var="pageNumber1" begin="1"
						end="${totalPages1/itemsPerPage1}">
						<li
							class="page-item <c:if test='${pageNumber1 == currentPage1}'>active</c:if>">
							<a class="page-link"
							href="<%=notWithFormTag%>meList&id=${sessionScope.loginfo.id}&page1=${pageNumber1}">${pageNumber1}</a>
						</li>

					</c:forEach>

					<c:if test="${currentPage1 < (totalPages1/itemsPerPage1)}">
						<li class="page-item"><a class="page-link"
							href="<%=notWithFormTag%>meList&id=${sessionScope.loginfo.id}&page1=${currentPage1 + 1}">Next</a></li>
					</c:if>
				</ul>

			</div>
		</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>