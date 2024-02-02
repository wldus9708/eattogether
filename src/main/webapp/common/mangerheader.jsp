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
				<a href="#"> <img src="./../image/cooker.png" alt="메인화면으로돌아가기">
				</a> <a id="logo_a" href="#">오늘 뭐먹지</a>
			</div>
			<div id="manheader">
				<ul>
					<li class="header">
					<a class="header-toggle" href="#" role="button"
						data-bs-toggle="dropdown">관리자▼</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="./../manager/manList.jsp">회원관리</a></li>
							<li><a class="dropdown-item" href="./../inquiry/inquList.jsp">문의사항</a></li>
							<li><a class="dropdown-item" href="#">공지사항 관리</a></li>
							<li><a class="dropdown-item" href="#">로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<script type="text/javascript">
		
	</script>
</body>

</html>