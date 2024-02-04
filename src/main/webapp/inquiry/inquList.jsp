<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/mangerheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/eattogether/css/inquiryListStyle.css">
<script>
</script>
</head>
<body>
	<div id="contain">

		<div id="box1">
			<a href="/eattogether/manager/manList.jsp" id="ma_memberbt">회원조회</a> 
			<a
				href="/eattogether/notice/mangernotiList.jsp " id="ma_announbt">공지사항</a> <a
				href="/eattogether/inquiry/inquList.jsp" id="ma_inquirybt">문의사항</a>
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
<%@include file="./../common/mangerfooter.jsp" %>