<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./../css/inquiryListStyle.css">
<script>
	document.getElementById("linkImage").addEventListener("click", function() {
		// 이미지를 클릭했을 때 처리할 내용을 여기에 추가
		// 예시: window.location.href = "다른 페이지 URL";
	});
</script>
</head>
<body>
	<div id="contain">

		<div id="box1">
			<button id="ma_memberbt">회원조회</button>
			<button id="ma_announbt">공지사항</button>
			<button id="ma_inquirybt">문의사항</button>
		</div>

		<div id="box2">
			<table>
				<tbody>
					<tr>
						<th style="width: 5%;" id="in-Information">글번호</th>
						<th style="width: 10%;" id="in-Information">작성일자</th>
						<th style="width: 30%;" id="in-Information">아이디</th>
					</tr>
					<tr>
						<th colspan="3" style="width: 50%;" id="in-contents">문의내용</th>
					</tr>
					<tr>
						<td colspan="3">
							<div id="textAreaContainer">
								<textarea id="textBox" placeholder="답글다는곳"></textarea>
								<button id="sendButton">전송</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>