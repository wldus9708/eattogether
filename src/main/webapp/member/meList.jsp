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
				<img src="/eattogether/image/${sessionScope.loginfo.picture}" id="mypage_icon" alt=" ">
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
					<c:set var="itemsPerPage1" value="4" />
					<c:set var="currentPage1"
						value="${empty param.page1 ? 1 : param.page1}" />
					<c:set var="startIdx1" value="${(currentPage1 - 1) * itemsPerPage1}" />
					<c:set var="endIdx1" value="${startIdx1 + itemsPerPage1 - 1}" />

					<c:forEach var="item" items="${cdataList}"
						varStatus="loopStatus" begin="${startIdx1}" end="${endIdx1}">
						
						<a
							href="<%=notWithFormTag%>reDetail&rec_no=${item.rec_no}">
							<img
							src="/eattogether/image/${item.rec_photo}"
							class="subima">
						</a>
					</c:forEach>

					<!-- 부트스트랩 페이징 -->
					<ul class="pagination pagination-sm justify-content-center">
						<c:set var="totalPages1"
							value="${cdataList.size() + itemsPerPage1 - 1}" />
						<c:if test="${currentPage1 > 1}">
							<li class="page-item"><a class="page-link"
								href="<%=notWithFormTag%>meList&page1=${currentPage1 - 1}">Previous</a></li>
						</c:if>

						<c:forEach var="pageNumber1" begin="1"
							end="${totalPages1/itemsPerPage1}">
							<li
								class="page-item <c:if test='${pageNumber1 == currentPage1}'>active</c:if>'">
								<a class="page-link"
								href="<%=notWithFormTag%>meList&page1=${pageNumber1}">${pageNumber1}</a>
							</li>
						</c:forEach>

						<c:if test="${currentPage1 < (totalPages1/itemsPerPage1)}">
							<li class="page-item"><a class="page-link"
								href="<%=notWithFormTag%>meList&page1=${currentPage1 + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			
			
			
			
			<div class="mysubpage_box01">
				<div class="submypage_Bookmark01">
					<div>닉네임'의 최근본 목록</div>
				</div>
				<div class="submypage_Bookmark02">

					<c:set var="itemsPerPage2" value="4" />
					<c:set var="currentPage2"
						value="${empty param.page2 ? 1 : param.page2}" />
					<c:set var="startIdx2" value="${(currentPage2 - 1) * itemsPerPage2}" />
					<c:set var="endIdx2" value="${startIdx2 + itemsPerPage2 - 1}" />

					<c:forEach var="item" items="${sessionScope.testList}"
						varStatus="loopStatus" begin="${startIdx2}" end="${endIdx2}">
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
						<c:set var="totalPages2"
							value="${sessionScope.testList.size() + itemsPerPage2 - 1}" />
						<c:if test="${currentPage2 > 1}">
							<li class="page-item"><a class="page-link"
								href="<%=notWithFormTag%>meList&page2=${currentPage2 - 1}">Previous</a></li>
						</c:if>

						<c:forEach var="pageNumber2" begin="1"
							end="${totalPages2/itemsPerPage2}">
							<li
								class="page-item <c:if test='${pageNumber2 == currentPage2}'>active</c:if>'">
								<a class="page-link"
								href="<%=notWithFormTag%>meList&page2=${pageNumber2}">${pageNumber2}</a>
							</li>
						</c:forEach>

						<c:if test="${currentPage2 < (totalPages2/itemsPerPage2)}">
							<li class="page-item"><a class="page-link"
								href="<%=notWithFormTag%>meList&page2=${currentPage2 + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>
