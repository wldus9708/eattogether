<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/mangerheader.jsp"%>
<%@include file ="./../common/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div id="main_wrap">
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
							<input type="text" placeholder="재료를 입력하세요">
							<button class="main_addButton" id="main_addButton1">+</button>
						</div>
					</div>

					<div class="main_selectbox"></div>
					<div class="main_materialBox_input">
						<div class="main_materialBox_input2 " id="main_input2">
							<input type="text" placeholder="원하지 않는 재료를 입력하세요">
							<button class="main_addButton" id="main_addButton2">+</button>
						</div>
					</div>
				</div>
				<div id="main_materialBox_search">

					<img src="../image/search_2.png">
				</div>
			</div>
		</div>
	</div>

<script>
$(document).ready(function() {
    var maxElementsUpper = 3;
    var maxElementsLower = 3;
    var maxInputLength = 7;

    function addElement(inputSelector, containerSelector, maxElements, className) {
        var inputValue = $(inputSelector + " input").val().trim();

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
            alert("최대 " + maxElements + "개까지만 추가할 수 있습니다.");
            return;
        }

        var newItem = $("<div>").addClass("inline-block-item " + className);
        newItem.append($("<span>").text(inputValue));
        newItem.append($("<span>").addClass("close-icon").text("-").on("click", function() {
            $(this).parent().remove();
        }));

        $(containerSelector).append(newItem);
        $(inputSelector + " input").val('');
    }

    // 상단 버튼(main_addButton1) 클릭 시 이벤트 처리
    $("#main_addButton1").on("click", function() {
        addElement("#main_input1", ".main_selectbox", maxElementsUpper, "upper-item");
    });

    // 하단 버튼(main_addButton2) 클릭 시 이벤트 처리
    $("#main_addButton2").on("click", function() {
        addElement("#main_input2", "#main_materialBox_right", maxElementsLower, "lower-item");
    });
});

</script>



</body>
</html>
<%@include file="./../common/footer.jsp" %>