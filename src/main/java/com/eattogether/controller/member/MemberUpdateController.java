package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;
import com.oreilly.servlet.MultipartRequest;


public class MemberUpdateController extends Superclass{
	private final String PREFIX="member/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		String id=request.getParameter("id");

		System.out.println(id);
		MemberDao dao =new MemberDao();
		Member bean=dao.getDataBean(id);
		System.out.println("doget");
		System.out.println(bean);
		request.setAttribute("bean", bean);
		super.gotoPage(PREFIX+"meUpdate.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		MemberDao dao = new MemberDao();
		Member bean = new Member();
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");	
		bean.setId(mr.getParameter("id"));
		bean.setName(mr.getParameter("name"));
		bean.setAlias(mr.getParameter("alias"));
		bean.setPassword(mr.getParameter("password"));
		bean.setPhone(mr.getParameter("phone"));
		bean.setTaste(mr.getParameter("taste"));
		bean.setPicture(mr.getFilesystemName("picture"));
		System.out.println("post");
		System.out.println(bean);
		
		int cnt =-1;
		cnt=dao.updateData(bean);
		if(cnt==1){//수정 성공
			new MemberListController().doGet(request, response);
		}else{//수정 실패	
			new MemberUpdateController().doGet(request, response);
		}
	}
	
}
