<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSONArray 객체에 대한 내용을 출력합니다. --%>
<%-- 단순히 출력 문장을 작성해 두면, 나머지는 $.ajax() 함수가 결과물을 챙겨 갑니다. --%>
<%
	JSONArray jsArr = (JSONArray)request.getAttribute("jsArr") ;
%>
<%=jsArr.toString()%>