package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

public class MemberMessageController extends Superclass{
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
	super.doGet(request, response);
	
	String id=request.getParameter("id");
	MemberDao dao =new MemberDao();
	Member bean=dao.getDataBean(id);
	System.out.println("doget");
	System.out.println(bean);
	request.setAttribute("bean", bean);
	super.gotoPage("member/dlete_message.jsp");
}
}
