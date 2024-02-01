<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./../css/manheaderStyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<nav>
		<div id="gr">
			<div id="logo">
			 <a href="#">
				<img src="./../image/cooker.png" alt="메인화면으로돌아가기">
				 </a>
				<a id="logo_a" href="#">오늘 뭐먹지</a>
			</div>
			<div id="manheader">
				<ul id="manheader_a">
					<li><a href="#" role="button"
						data-bs-toggle="dropdown" id="manheader_f">&nbsp;&nbsp;관리자▼&nbsp;&nbsp;</a>
						<div id="manheader_c">
							<button id="manheader_d" onclick="navigateTo01()">회원관리</button>
							<button id="manheader_d" onclick="navigateTo02()">문의관리</button>
							<button id="manheader_d" onclick="navigateTo('#')">공지사항관리</button>
							<button id="manheader_d" onclick="navigateTo('#')">로그아웃</button>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<script type="text/javascript">

function navigateTo01() {
    window.location.href ="./../manager/manList.jsp";
  }
function navigateTo02() {
    window.location.href ="./../inquiry/inquList.jsp";
  }
	var manheaderF = document.getElementById('manheader_f');
	var manheaderC = document.getElementById('manheader_c');


	// 닫기 버튼이나 다른 지역을 클릭할 때 드롭다운 메뉴 닫기
	document.addEventListener('click', function(event) {
		if (!event.target.matches('#manheader_f')
				&& !event.target.closest('#manheader_c')) {
			manheaderC.classList.remove('active');
		}
	});

</script>
</body>

</html>