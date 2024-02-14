<%@page import="com.eattogether.model.bean.Recipe"%>
<%@page import="com.eattogether.model.dao.RecipeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/eattogether/css/mypage2.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="Mypage_ntr">
		<div id="mypage_box00">
			<div class="custom-shape" id="myicon">
				<img src="/eattogether/image/pasta_01.jpg" id="mypage_icon" alt=" ">
			</div>
			<div id="mypage_box10">
				<table id="submypage_Input">
					<tr>
						<td id="submyname" style="width: 25%">이름</td>
						<td><span>${sessionScope.loginfo.name}</span></td>
					<tr>
					<tr>
						<td id="submyid" style="width: 25%">닉네임</td>
						<td><span>${sessionScope.loginfo.alias}</span></td>
					<tr>
					<tr>
						<td id="submyfood" style="width: 25%">음식취향</td>
						<td><span>${sessionScope.loginfo.taste}</span></td>
					<tr>
					<tr>
						<td id="subcoment" style="width: 25%">코멘트</td>
						<td><span>코멘트(나중에EL&JSTL쓸곳)</span></td>
					<tr>
				</table>

			</div>
			<div class="mypage_button">
				<a href="<%=notWithFormTag%>meUpdate&id=${sessionScope.loginfo.id}">
					<div id="bupdate">
						<p id="od00">마이페이지수정</p>
					</div>
				</a> <a
					href="<%=notWithFormTag%>meMessage&id=${sessionScope.loginfo.id}">
					<div id="binselt">
						<p id="od01">회원탈퇴</p>
					</div>
				</a>
			</div>
		</div>


		<div id="submypage_contain02">
			<div class="mysubpage_box01">
				<div class="submypage_Bookmark01">
					<div>'닉네임'의 즐겨찾기</div>
				</div>
				<div class="submypage_Bookmark02">
					<img src="/eattogether/image/steak_02.jpg" class="subima"> <img
						src="/eattogether/image/steak_02.jpg" class="subima"> <img
						src="/eattogether/image/steak_02.jpg" class="subima"> <img
						src="/eattogether/image/steak_02.jpg" class="subima">
				</div>
			</div>
			<div class="mysubpage_box01">
				<div class="submypage_Bookmark01">
					<div>내가 만든 레시피</div>
				</div>
				<div class="submypage_Bookmark02">
					<img src="/eattogether/image/steak_02.jpg" class="subima"> <img
						src="/eattogether/image/steak_02.jpg" class="subima"> <img
						src="/eattogether/image/steak_02.jpg" class="subima"> <img
						src="/eattogether/image/steak_02.jpg" class="subima">
				</div>
			</div>
			<div class="mysubpage_box01">
				<div class="submypage_Bookmark01">
					<div>닉네임'의 최근본 목록</div>
				</div>
				<div class="submypage_Bookmark02">

					<c:set var="itemsPerPage" value="4" />
					<c:set var="currentPage"
						value="${empty param.page ? 1 : param.page}" />
					<c:set var="startIdx" value="${(currentPage - 1) * itemsPerPage}" />
					<c:set var="endIdx" value="${startIdx + itemsPerPage - 1}" />

					<c:forEach var="item" items="${sessionScope.testList}"
						varStatus="loopStatus" begin="${startIdx}" end="${endIdx}">
						<c:set var="reverseIndex"
							value="${sessionScope.testList.size() - loopStatus.index - 1}" />
						<a
							href="<%=notWithFormTag%>reDetail&rec_no=${sessionScope.testList[reverseIndex].rec_no}">
							<img
							src="/eattogether/image/${sessionScope.testList[reverseIndex].rec_photo}"
							class="subima">
						</a>
					</c:forEach>

					<!-- 부트스트랩 페이징 -->
					<ul class="pagination pagination-sm justify-content-center">
						<c:set var="totalPages"
							value="${sessionScope.testList.size() + itemsPerPage - 1}" />
						<c:if test="${currentPage > 1}">
							<li class="page-item"><a class="page-link"
								href="<%=notWithFormTag%>meList&mypage2?page=${currentPage - 1}">Previous</a></li>
						</c:if>

						<c:forEach var="pageNumber" begin="1"
							end="${totalPages/itemsPerPage}">
							<li
								class="page-item <c:if test='${pageNumber == currentPage}'>active</c:if>'">
								<a class="page-link"
								href="<%=notWithFormTag%>meList&mypage2?page=${pageNumber}">${pageNumber}</a>
							</li>
						</c:forEach>

						<c:if test="${currentPage < (totalPages/itemsPerPage)}">
							<li class="page-item"><a class="page-link"
								href="<%=notWithFormTag%>meList&mypage2?page=${currentPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
<%@include file="./../common/footer.jsp"%>
