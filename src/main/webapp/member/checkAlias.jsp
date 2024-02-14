<%@page import="com.eattogether.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<%
request.setCharacterEncoding("utf-8");
String alias = request.getParameter("alias");
MemberDao dao = new MemberDao();
int result = 0;
if (alias != null && !alias.isEmpty()) {
    result = dao.getDataByAlias(alias);
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/eattogether/css/checkAlias.css">
<meta charset="UTF-8">
<title>닉네임 중복 검사</title>
<script type="text/javascript">

    $(function(){
        $('#check_submit').click(function(event){
            var alias = $('#alias').val();
            var newAction = "checkAlias.jsp?alias=" + alias;
            $('form[name="frmAlias"]').attr('action', newAction);
            $('form[name="frmAlias"]').submit(); 
           
        });

        $('#check_btUse').click(function(){
            var alias = '<%=alias%>';
            opener.document.getElementById('join_alias').value = alias;
            opener.document.getElementById('join_aliasCheck').value = 'Y';
            window.close();
        });
        
    });
</script>
</head>
<body>
<div id="checkAlias_wrap">
	<h2>닉네임 중복 검사</h2>
<br>
<form name="frmAlias" method="post" action="checkAlias.jsp?alias=<%=alias%>">
    <input type="text" name="alias" id="alias" value="<%=alias%>" title="닉네임 입력">
    <input type="submit" id="check_submit" value="닉네임 확인">
    
    <% if (result == MemberDao.UNUSABLE_ALIAS) { %>
        <p style="color: red">이미 등록된 닉네임입니다. 다른 아이디를 입력하세요</p>
    <% } else if (result == MemberDao.USABLE_ALIAS) { %>
        <input type="button" value="사용하기" id="check_btUse">
        <p style="color: green">사용 가능한 닉네임입니다. [사용하기] 버튼을 클릭하세요</p>
    <% } %>
</form>
</div>

</body>
</html>
