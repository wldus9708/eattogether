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
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
body {
    background: #F8EBCE;
}

#findUserid_wrap {
    margin-top: 30px;
    margin-left: 30px;
}
.findId_form_container {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}
.findId_label {
    margin-right: 10px;
    width: 100px;
    text-align: center;
}
.findId_input_field {
    width: 200px;
    border-radius: 12px;
}
#findId_submit {
    background: #ED6D35;
    border-radius: 7px;
    width: 110px;
    height: 33px;
    font-weight: bold
}
#findId_btn{
	margin-left: 150px;
    margin-top: 30px;
    margin-bottom: 20px;
	
}
.findId_result p{
	font-size: 20px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
    $(function() {
        $('#submit').click(function(event) {
            var name = $('#findId_name').val();
            var phone = $('#findId_phone').val();
            var newAction = "findUserid.jsp?name=" + name + "&phone=" + phone;
            $('form[name="frmfindId"]').attr('action', newAction);
            $('form[name="frmfindId"]').submit();
        });
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