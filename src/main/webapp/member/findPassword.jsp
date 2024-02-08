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
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
body {
    background: #F8EBCE;
}

#findPassword_wrap {
    margin-top: 30px;
    margin-left: 30px;
}
.findPwd_form_container {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}
.findPwd_label {
    margin-right: 10px;
    width: 100px;
    text-align: center;
}
.findPwd_input_field {
    width: 200px;
    border-radius: 12px;
}
#findPwd_submit {
    background: #ED6D35;
    border-radius: 7px;
    width: 110px;
    height: 33px;
    font-weight: bold
}
#findPwd_btn{
	margin-left: 150px;
    margin-top: 30px;
    margin-bottom: 20px;
	
}
.findPwd_result p{
	font-size: 20px;
	font-weight: bold;
}
</style>
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
