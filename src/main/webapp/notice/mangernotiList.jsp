<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./../css/mangernotiListStyle.css">

</head>
<body>
	<div id="contain">
		<div id="box1">
			<a href="./../manager/manList.jsp" id="ma_memberbt">회원조회</a> <a
				href="./../notice/mangernotiList.jsp " id="ma_announbt">공지사항</a> <a
				href="./../inquiry/inquList.jsp" id="ma_inquirybt">문의사항</a>
		</div>
		<div id="box2">
			<section class="inquiries">
				<h2>공지사항</h2>
				<ul id="inquiryList">
					<li><a href="#" class="toggleInquiry">공지사항</a>
						<div class="inquiryDetails">
							<div id="manger_contents">
								<p>서비스향상을위해 전체적으로업데이트가 있을예정입니다.</p>
							</div>
							<div id="manger_modify">
								<a href="https://www.naver.com/" id="editInquiry">수정하기</a>
							</div>
						</div></li>
				</ul>
			</section>
		</div>
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
<%@include file="./../common/mangerfooter.jsp" %>