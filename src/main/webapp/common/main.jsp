<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/eattogether/css/main.css">
<style>
    @keyframes moveLR {
        0% {
            transform: translateX(0) rotate(0deg);
        }
        50% {
            transform: translateX(-15px) rotate(-30deg);
        }
        100% {
            transform: translateX(15px) rotate(30deg);
        }
    }

    #main_loadDiv {
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        position: fixed;
        background: #F8EBCE;
        display: flex;
        z-index: 999;
        opacity: 0.9;
    }

    #main_loadImg {
        display: flex;
        width: fit-content;
        height: fit-content;
        margin: auto;
        animation: moveLR 0.5s ease infinite alternate;
    }

    #footer_butt {
        width: 160px;
        background-color: #FFCD1D;
    }

    #inquirybox {
        margin-top: 130px;
    }
</style>

<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true

		});

	});
	$(window).on('load', function() {
		setTimeout(function() {
			$("#main_loadDiv").fadeOut();
		}, 300);
	});
	function changeImg() {
		var imageElement = $("#myImage");

		if (imageElement.attr('src').endsWith('./../image/emptystar.png')) {
			imageElement.attr('src', './../image/star.png');
		} else {
			imageElement.attr('src', './../image/emptystar.png');
		}
	}
	function validCheck() {/* 폼 유효성 검사 */
		var inq_content = $('#inq_content').val();
		if (inq_content.trim() === '') {
			alert('글내용이 없습니다.');
			$('#inq_content').focus();
			return false;
		}
	}
</script>
<script>
		$(document).ready(function(){
		    $("#accordion").accordion({
		        collapsible: true,
		        active: false, // 초기에는 모든 아코디언이 닫혀있도록 설정
		        activate: function(event, ui) {
		            var index = $(this).accordion("option", "active");
		            sessionStorage.setItem('selectedAccordion', index);
		        }
		    });
		
		    var selectedAccordion = sessionStorage.getItem('selectedAccordion');
		    if (selectedAccordion !== null && selectedAccordion !== undefined) {
		        $("#accordion").accordion("option", "active", parseInt(selectedAccordion));
		    }
		
		    // 아코디언 버튼 클릭 이벤트 처리
		    $("#accordion h3").click(function() {
		        var index = $(this).index() / 2; // 클릭한 아코디언의 인덱스
		
		        // 클릭한 아코디언의 인덱스를 저장
		        sessionStorage.setItem('selectedAccordion', index);
		        
		        // 클릭한 아코디언이 이미 열려있는 경우에는 클릭 이벤트 중지
		        if ($(this).next("div").is(":visible")) {
		            return false;
		        }
		    });
		});
	</script>
</head>
<body>
	<div id="main_loadDiv">
		<img id="main_loadImg" src="/eattogether/image/cooker.png">
	</div>
	<div id="main_wrap">
		<div id="main_materialBox00">
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
				<li><a href="<%=notWithFormTag%>reList&mode=rec_header&keyword=고등어&p=s">고등어조림</a></li>
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
		
			<div id="main_materialBox">
				<div id="main_materialBox_left">
					<div id="main_materialBox_left_1">
    <div id="main_materialBox_left_2" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:if test="${pictureCheck eq 1}">
                <div class="carousel-item active">
                    <a href="<%=notWithFormTag%>reDetail&rec_no=${pictureDatalist[0].rec_no}&readhitUpdate=true">
                        <img src="/eattogether/image/${pictureDatalist[0].rec_photo}" class="d-block w-100">
                    </a>
                </div>
                <c:if test="${pictureDatalist.size()==2}">
                <div class="carousel-item">
                    <a href="<%=notWithFormTag%>reDetail&rec_no=${pictureDatalist[1].rec_no}&readhitUpdate=true">
                        <img src="/eattogether/image/${pictureDatalist[1].rec_photo}" class="d-block w-100">
                    </a>
                </div>
                </c:if>
                <c:if test="${pictureDatalist.size()==3}">
                <div class="carousel-item">
                    <a href="<%=notWithFormTag%>reDetail&rec_no=${pictureDatalist[1].rec_no}&readhitUpdate=true">
                        <img src="/eattogether/image/${pictureDatalist[1].rec_photo}" class="d-block w-100">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="<%=notWithFormTag%>reDetail&rec_no=${pictureDatalist[2].rec_no}&readhitUpdate=true">
                        <img src="/eattogether/image/${pictureDatalist[2].rec_photo}" class="d-block w-100">
                    </a>
                </div>
                </c:if>
            </c:if>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#main_materialBox_left_2" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#main_materialBox_left_2" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
</button>
    </div>


<!-- Left and right controls/icons -->


</div>
					<div id="main_materialBox_right">
						<div id="main_materialBox_right_1">
							<p>냉장고 안엔 무슨재료가 있을까요</p>
						</div>
						<div class="main_materialBox_input">
							<div class="main_materialBox_input2" id="main_input1">
								<input type="text" placeholder="재료를 입력하세요" maxlength="7">
								<button type="button" class="main_addButton"
									id="main_addButton1">+</button>
							</div>
						</div>

						<div class="main_selectbox"></div>
						<div class="main_materialBox_input">
							<div class="main_materialBox_input2 " id="main_input2">
								<input type="text" placeholder="원하지 않는 재료를 입력하세요" maxlength="7">
								<button type="button" class="main_addButton"
									id="main_addButton2">+</button>
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
	<script>
	$(document).ready(function() {
	    var maxElementsUpper = 3;
	    var maxElementsLower = 3;
	    var maxInputLength = 7;
	    var likeTaste = []; // 수정: 변수 이름 수정
	    var dislikeTaste = []; // 수정: 변수 이름 수정

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
	    	var inputValue = $("#main_input1 input").val().trim();
	        if (inputValue !== "") {
	            likeTaste.push(inputValue);
	        }
	        addElement("#main_input1", ".main_selectbox", maxElementsUpper, "upper-item");
	        console.log(likeTaste.join(","));
	    });

	    // 하단 버튼(main_addButton2) 클릭 시 이벤트 처리
	    $("#main_addButton2").on("click", function() {	
	    	var inputValue = $("#main_input2 input").val().trim();
        if (inputValue !== "") {
            dislikeTaste.push(inputValue);
        }
	        addElement("#main_input2", "#main_materialBox_right", maxElementsLower, "lower-item");
	        console.log("Button 2 clicked");
	    });

	    // 검색 버튼(main_searchButton) 클릭 시 이벤트 처리
	    $("#main_searchButton").on("click", function() {
	        var upperItemCount = $(".main_selectbox .upper-item").length;
	        var lowerItemCount = $("#main_materialBox_right .lower-item").length;

	        if (upperItemCount === 0 && lowerItemCount === 0) {
	            alert("재료 또는 먹고싶지않은 재료를 입력하세요.");
	        }
	        window.location.href = "<%=notWithFormTag%>mePicture&likeTaste=" + likeTaste.join(",") + "&dislikeTaste=" + dislikeTaste.join(",");
	    });
	});
</script>

</body>
</html>
<%@include file="./../common/mangerfooter.jsp"%>