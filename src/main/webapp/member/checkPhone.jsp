<%@page import="com.eattogether.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<%
request.setCharacterEncoding("utf-8");
String phone = request.getParameter("phone");
MemberDao dao = new MemberDao();
int result = 0;
if (phone != null && !phone.isEmpty()) {
    result = dao.getDataByPhone(phone);
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/checkPhone.css">
<meta charset="UTF-8">
<title>전화번호 중복 검사</title>
<script type="text/javascript">

    $(function(){
        $('#check_submit').click(function(event){
            var phone = $('#phone').val();
            var newAction = "checkPhone.jsp?phone=" + phone;
            $('form[name="frmPhone"]').attr('action', newAction);
            $('form[name="frmPhone"]').submit(); 
           
        });

        $('#check_btUse').click(function(){
            var phone = '<%=phone%>';
            opener.document.getElementById('join_phone').value = phone;
            opener.document.getElementById('join_phoneCheck').value = 'Y';
            window.close();
        });
        
    });
</script>
</head>
<body>
<div id="checkphone_wrap">
	<h2>전화번호 중복 검사</h2>
<br>
<form name="frmPhone" method="post" action="checkphone.jsp?phone=<%=phone%>">
    <input type="text" name="phone" id="phone" value="<%=phone%>" maxlength="11" placeholder="'-'빼고 입력해주세요" title="전화번호입력">
    <input type="submit" id="check_submit" value="전화번호 확인">
    
    <% if (result == MemberDao.UNUSABLE_PHONE) { %>
        <p style="color: red">이미 등록된 전화번호입니다. 다른 전화번호를 입력하세요</p>
    <% } else if (result == MemberDao.USABLE_PHONE) { %>
        <input type="button" value="사용하기" id="check_btUse">
        <p style="color: green">사용 가능한 전화번호입니다. [사용하기] 버튼을 클릭하세요</p>
    <% } %>
</form>
</div>

</body>
</html>
