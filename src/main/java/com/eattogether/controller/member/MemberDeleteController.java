package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.dao.MemberDao;

public class MemberDeleteController extends Superclass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		String id=request.getParameter("id");
		System.out.println(id);
		MemberDao dao=new MemberDao();
		int cnt=-1;
		cnt=dao.deleteData(id);
		if(cnt!=-1) {
			System.out.println("탈퇴성공");
			super.session.invalidate();
		new MemberLogoutController().doGet(request, response);
		}else {
			System.out.println("탈퇴실패");
		super.gotoPage("member/meList.jsp");
		}
	}

}
