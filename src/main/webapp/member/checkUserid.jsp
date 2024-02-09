<%@page import="com.eattogether.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
MemberDao dao = new MemberDao();
int result = 0;
if (id != null && !id.isEmpty()) {
    result = dao.getDataById(id);
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/checkUserid.css">
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<script type="text/javascript">

    $(function(){
        $('#check_submit').click(function(event){
            var id = $('#userid').val();
            var newAction = "checkUserid.jsp?id=" + id;
            $('form[name="frmId"]').attr('action', newAction);
            $('form[name="frmId"]').submit(); 
           
        });

        $('#check_btUse').click(function(){
            var id = '<%=id%>';
            opener.document.getElementById('join_id').value = id;
            opener.document.getElementById('join_idCheck').value = 'Y';
            window.close();
        });
        
    });
</script>
</head>
<body>
<div id="checkUserid_wrap">
	<h2>아이디 중복 검사</h2>
<br>
<form name="frmId" method="post" action="checkUserid.jsp?id=<%=id%>">
    <input type="text" name="userid" id="userid" value="<%=id%>" title="아이디입력">
    <input type="submit" id="check_submit" value="아이디 확인">
    
    <% if (result == MemberDao.UNUSABLE_ID) { %>
        <p style="color: red">이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
    <% } else if (result == MemberDao.USABLE_ID) { %>
        <input type="button" value="사용하기" id="check_btUse">
        <p style="color: green">사용 가능한 아이디입니다. [사용하기] 버튼을 클릭하세요</p>
    <% } %>
</form>
</div>

</body>
</html>
