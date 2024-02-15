<%@page import="com.eattogether.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
MemberDao dao = new MemberDao();
String result = "";
if (name != null && !name.isEmpty() && phone != null && !phone.isEmpty()) {
    result = dao.getDataByNameAndPhone(name,phone);
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/findUserid.css">
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
    $(function() {
        $('#findId_submit').click(function(event) {
            if (!validateForm()) {
                event.preventDefault(); // 폼 제출을 중단
                alert("모든 정보를 입력하세요."); // 알림창 표시
            }
        });
        
        function validateForm() {
            var name = $('#findId_name').val();
            var phone = $('#findId_phone').val();
            if (name.trim() === "" || phone.trim() === "") {
                return false; // 입력값이 비어있으면 false 반환
            }
            return true; // 유효한 경우 true 반환
        }
    });
</script>
</head>
<body>
    <div id="findUserid_wrap">
        <h2>아이디 찾기</h2>
        <br>
        <form name="frmfindId" method="post" action="findUserid.jsp">
            <div class="findId_form_container">
                <label class="findId_label" for="name">이름:</label>
                <input class="findId_input_field" type="text" id="findId_name" name="name" maxlength="8">
            </div>
            <div class="findId_form_container">
                <label class="findId_label" for="phone">전화번호:</label>
                <input class="findId_input_field" type="text" id="findId_phone" name="phone" maxlength="11" placeholder="'-'빼고 입력해주세요. ">
            </div>
            <div id="findId_btn">
	            <input type="submit" id="findId_submit" value="아이디 찾기">
            </div>
        </form>
        <%-- 결과 표시 --%>
        <% if (result != null) { %>
    		<% if (!result.isEmpty()) { %>
		        <div class="findId_result">
		            <p>아이디 : <%= result %></p>
		        </div>
    		<% } else { %>
    	<% } %>
		<% } else { %>
		    <div class="findId_result">
		        <p>해당 정보로 등록된 아이디가 없습니다.</p>
		    </div>
	<% } %>
    </div>
</body>
</html>
