<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/eattogether/css/recipedetailStyle.css">

<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true

		});
	});

	function changeImg() {
        var imageElement = $("#myImage");
        var currentSrc = imageElement.attr('src');

        // 로그인 여부 확인
        <c:choose>
            <c:when test="${empty sessionScope.loginfo}">
                alert("즐겨찾기를 추가하려면 먼저 로그인하세요.");
                return;
            </c:when>
            <c:otherwise>
                if (currentSrc.includes('/eattogether/image/emptystar.png')) {
                    window.location.href ="<%=notWithFormTag%>reStar&rec_no=${bean.rec_no}&tp=0";
                } else {
                    window.location.href ="<%=notWithFormTag%>reStar&rec_no=${bean.rec_no}&tp=1";
                }
            </c:otherwise>
        </c:choose>
    }
</script>
</head>
<body>
	<div id="recipedetail_entire">
		<div id="recipedetail_contain01">
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
		<div id="recipedetail_contain02">
			<div id="recipedetail_box01">
				<div id="recipedetail1">
					<div>
						<a href="/eattogether/member/Submypage2.jsp" class="userBtn"><img
							src="/eattogether/image/user.png" alt=""></a>
					</div>
					<div>
						<a href="/eattogether/member/Submypage2.jsp" class="userId"><span
							id="recipeDetail_Id">${combo.alias}</span></a>
					</div>
					<div>
						<a href="#" class="upBtn"><span id="recipeUp">${bean.rec_hit}</span>
							<img src="/eattogether/image/eye3.png" style="width: 25px" height="25px" alt=""> </a>
					</div>
					<div>
					<c:if test="${a==0}">
						<img id="myImage" class="overlay-image right-align"
							src="/eattogether/image/emptystar.png" onclick="changeImg()"
							alt="${bean.rec_bookmark}">
						<!-- 즐겨찾기 -->
						</c:if>
						<c:if test="${a==1}">
						<img id="myImage" class="overlay-image right-align"
							src="/eattogether/image/star.png" onclick="changeImg()"
							alt="${bean.rec_bookmark}">
						<!-- 즐겨찾기 -->
						</c:if>
						<c:if test="${a==null}">
						<img id="myImage" class="overlay-image right-align"
							src="/eattogether/image/emptystar.png" onclick="changeImg()"
							alt="${bean.rec_bookmark}">
						<!-- 즐겨찾기 -->
						</c:if>
					</div>
				</div>
				<div id="recipedetail2">
					<div id="recipe_container">
						<div class="recipe_image">
							<a class="removeUnderLine" href="#"> <img class="card-img"
								src="/eattogether/image/${bean.rec_photo}"
								alt="${bean.rec_photo}"></a>
						</div>
					</div>
				</div>
			</div>
			<div id="recipedetail_box02">
				<table id="recipetitle">
					<tr>
						<th colspan="2" id="re_title">${bean.rec_header}</th>
					</tr>
					<tr>
						<td style="width: 5%;" id="re_mat">재료</td>
						<td style="width: 45%;" id="re_matkind">${bean.rec_material}</td>
					</tr>
					<tr>
						<td style="width: 5%;" id="re_recipe">레시피</td>
						<td style="width: 45%;" id="re_number">
							<ul id="re_Sequence">
								<%
								for (int i = 1; i <= 10; i++) {
									String content = (String) request.getAttribute("rec_content" + i);
									if (content != null && !content.isEmpty()) {
								%>
								<li><%=content%></li>
								<%
								}
								}
								%>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>

</html>
<%@include file="./../common/mangerfooter.jsp"%>