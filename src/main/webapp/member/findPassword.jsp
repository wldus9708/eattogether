<%@page import="com.eattogether.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String phone = request.getParameter("phone");
MemberDao dao = new MemberDao();
String result = "";
if (id != null && !id.isEmpty() && phone != null && !phone.isEmpty()) {
    result = dao.getDataByIdAndPhone(id, phone);
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/findPassword.css">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
    $(function() {
        $('#submit').click(function(event) {
            var id = $('#findPwd_id').val();
            var phone = $('#findPwd_phone').val();
            var newAction = "findUserid.jsp?id=" + id + "&phone=" + phone;
            $('form[name="frmfindPwd"]').attr('action', newAction);
            $('form[name="frmfindPwd}"]').submit();
        });
    });
</script>
</head>
<body>
    <div id="findPassword_wrap">
        <h2>비밀번호 찾기</h2>
        <br>
        <form name="frmfindPwd" method="post" action="findPassword.jsp">
            <div class="findPwd_form_container">
                <label class="findPwd_label" for="id">아이디:</label>
                <input class="findPwd_input_field" type="text" id="findPwd_id" name="id" maxlength="8">
            </div>
            <div class="findPwd_form_container">
                <label class="findPwd_label" for="phone">전화번호:</label>
                <input class="findPwd_input_field" type="text" id="findPwd_phone" name="phone" maxlength="11" placeholder="'-'빼고 입력해주세요. ">
            </div>
            <div id="findPwd_btn">
	            <input type="submit" id="findPwd_submit" value="비밀번호 찾기">
            </div>
        </form>
        <%-- 결과 표시 --%>
        <% if (result != null) { %>
    		<% if (!result.isEmpty()) { %>
		        <div class="findPwd_result">
		            <p>비밀번호 : <%= result %></p>
		        </div>
    		<% } else { %>
    	<% } %>
		<% } else { %>
		    <div class="findPwd_result">
		        <p>입력하신 정보가 맞지않습니다.</p>
		    </div>
	<% } %>
    </div>
</body>
</html>
