<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/eattogether/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true

		});
	});

	function changeImg() {
		var imageElement = $("#myImage");

		if (imageElement.attr('src').endsWith('./../image/emptystar.png')) {
			imageElement.attr('src', './../image/star.png');
		} else {
			imageElement.attr('src', './../image/emptystar.png');
		}
	}
</script>
<style>
</style>
</head>
<body>
	<form>
		<div id="main_wrap">
			<div id="main_materialBox00">
				<div class="recipe_side0">
					<h3 id="recipe">
						<p>레시피</p>
					</h3>
				</div>

				<div id="accordion">
					<h3>
						<a href="#">양식</a>
					</h3>
					<ul>
						<li><a href="#">파스타</a></li>
						<li><a href="#">리조또</a></li>
						<li><a href="#">스테이크</a></li>
						<li><a href="#">피자</a></li>
						<li><a href="#">오믈렛</a></li>
					</ul>

					<h3>
						<a href="#">한식</a>
					</h3>
					<ul>
						<li><a href="#">김치볶음밥</a></li>
						<li><a href="#">된장찌개</a></li>
						<li><a href="#">김치찌개</a></li>
						<li><a href="#">고등어조림</a></li>
						<li><a href="#">고추장삼겹살</a></li>
					</ul>

					<h3>
						<a href="#">중식</a>
					</h3>
					<ul>
						<li><a href="#">마라탕</a></li>
						<li><a href="#">탕후루</a></li>
						<li><a href="#">짬뽕</a></li>
						<li><a href="#">잡채밥</a></li>
						<li><a href="#">유린기</a></li>
					</ul>

					<h3>
						<a href="#">일식</a>
					</h3>
					<ul>
						<li><a href="#">초밥</a></li>
						<li><a href="#">호토마키</a></li>
						<li><a href="#">우동</a></li>
						<li><a href="#">가라아게</a></li>
						<li><a href="#">덴뿌라</a></li>
					</ul>
				</div>
			</div>
			<div id="main_materialBox">
				<div id="main_materialBox_left">
					<div id="main_materialBox_left_1">
						<img src="../image/left.png">
						<div id="main_materialBox_left_2"></div>
						<img src="../image/right.png">
					</div>
					<div id="main_materialBox_right">
						<div id="main_materialBox_right_1">
							<p>냉장고 안엔 무슨재료가 있을까요</p>
						</div>
						<div class="main_materialBox_input">
							<div class="main_materialBox_input2" id="main_input1">
								<input type="text" placeholder="재료를 입력하세요" maxlength="7">
								<button class="main_addButton" id="main_addButton1">+</button>
							</div>
						</div>

						<div class="main_selectbox"></div>
						<div class="main_materialBox_input">
							<div class="main_materialBox_input2 " id="main_input2">
								<input type="text" placeholder="원하지 않는 재료를 입력하세요" maxlength="7">
								<button class="main_addButton" id="main_addButton2">+</button>
							</div>
						</div>
					</div>
					<div id="main_materialBox_search">
						<button type="submit" id="main_searchButton">
							<img src="/eattogether/image/search_2.png">
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		$(document)
				.ready(
						function() {
							var maxElementsUpper = 3;
							var maxElementsLower = 3;
							var maxInputLength = 7;

							function addElement(inputSelector,
									containerSelector, maxElements, className) {
								var inputValue = $(inputSelector + " input")
										.val().trim();

								if (inputValue === "") {
									if (inputSelector === "#main_input1") {
										alert("재료를 입력하세요.");
									} else if (inputSelector === "#main_input2") {
										alert("원하지 않는 재료를 입력하세요.");
									}
									return;
								}

								if (inputValue.length > maxInputLength) {
									alert("입력값은 7글자 이내로 입력하세요.");
									return;
								}

								if ($(containerSelector + " ." + className).length >= maxElements) {
									alert("최대 " + maxElements
											+ "개까지만 추가할 수 있습니다.");
									return;
								}

								var newItem = $("<div>").addClass(
										"inline-block-item " + className);
								newItem.append($("<span>").text(inputValue));
								newItem.append($("<span>").addClass(
										"close-icon").text("-").on("click",
										function() {
											$(this).parent().remove();
										}));

								$(containerSelector).append(newItem);
								$(inputSelector + " input").val('');
							}

							// 상단 버튼(main_addButton1) 클릭 시 이벤트 처리
							$("#main_addButton1")
									.on(
											"click",
											function() {
												addElement("#main_input1",
														".main_selectbox",
														maxElementsUpper,
														"upper-item");
											});

							// 하단 버튼(main_addButton2) 클릭 시 이벤트 처리
							$("#main_addButton2")
									.on(
											"click",
											function() {
												addElement(
														"#main_input2",
														"#main_materialBox_right",
														maxElementsLower,
														"lower-item");
											});
						});
	</script>
</body>
</html>
<%@include file="./../common/footer.jsp"%>