<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/eattogether/css/mydataupdate2.css">
<style>
</style>
</head>
<body>
	<c:set var="bean" value="${sessionScope.loginfo}"></c:set>
	<div id="updateMypage_entir">

		<div id="myupdate_box00">
			<div class="custom-shape" id="myupdateicon">
				<img src="/eattogether/image/${bean.picture}" id="myupdate_icon">
			</div>

		</div>
		<div id="myupdate_box10">
			<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="command" value="meUpdate">
				<table id="submypage_Input">
					<tr>
						<td id="myUp01">아이디</td>
						<td><input type="text" class="form-control" id="fakeid"
							name="fakeid" disabled="disabled" value="${bean.id}"> <input
							type="hidden" class="form-control custom-textbox" id="id"
							name="id" value="${bean.id}"></td>
					</tr>
					<tr>
						<td id="myUp02">이름</td>
						<td><input type="text" class="form-control" id="fakename"
							name="fakename" disabled="disabled" value="${bean.name}">
							<input type="hidden" class="form-control custom-textbox"
							id="name" name="name" value="${bean.name}"></td>
					</tr>
					<tr>
						<td id="myUp03">닉네임</td>
						<td><input type="text" class="form-control custom-textbox"
							id="alias" name="alias" value="${bean.alias}"></td>
					</tr>
					<tr>
						<td id="myUp04">비밀번호</td>
						<td><input type="password"
							class="form-control custom-textbox" id="password" name="password"
							value="${bean.password}"></td>
					</tr>

					<tr>
						<td id="myUp05">핸드폰번호</td>
						<td><input type="text" class="form-control custom-textbox"
							id="phone" name="phone" value="${bean.phone}"></td>
					</tr>

					<tr class="join_form_container">
						<td id="myUp06" class="join_label" for="favorite_food">좋아하는 음식:</td>
						<td class="join_food_opt_container">
							<label class="join_food_opt_label" for="join_favorite_food1">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food1" name="taste" value="한식">
								한식
							</label> <label class="join_food_opt_label" for="join_favorite_food2">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food2" name="taste" value="일식">
								일식
							</label> <label class="join_food_opt_label" for="join_favorite_food3">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food3" name="taste" value="양식">
								양식
							</label> <label class="join_food_opt_label" for="join_favorite_food4">
								<input class="join_food_opt" type="checkbox"
								id="join_favorite_food4" name="taste" value="중식">
								중식
							</label>
						</td>
						<span id="join_favoriteFoodError" class="join_error_next_box"></span>
					
					</tr>
					<tr>
						<td id="myUp07">프로필사진</td>
						<td>
							<div class="input-group">
								<input class="form-control" type="file" id="picture"
									name="picture"> <input type="hidden"
									name="deleteImage" value="${bean.picture}">
							</div>
						</td>
					</tr>


				</table>
				<div class="myupdate_button">

					<div id="update_binselt">
						<button type="submit" id="update_od01">수정</button>
					</div>
					<div id="update_binselt">
						<a href="<%=notWithFormTag%>meList&id=${sessionScope.loginfo.id}" id="update_od01">돌아가기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>