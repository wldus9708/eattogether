package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;


public class MemberUpdateController extends Superclass{
	private final String PREFIX="member/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		//현재 로그인 한 사람의 아이디
		String id=request.getParameter("id");
		MemberDao dao =new MemberDao();
		Member bean=dao.getDataBean(id);

		request.setAttribute("bean", bean);
		super.gotoPage(PREFIX+"meUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		MemberDao dao = new MemberDao();
		Member bean = new Member();
		
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setId(request.getParameter("id"));
		bean.setName(request.getParameter("name"));
		bean.setPassword(request.getParameter("password"));
		bean.setAlias(request.getParameter("alias"));
		bean.setPhone(request.getParameter("phone"));
		bean.setTaste(request.getParameter("taste"));
		
		int cnt = dao.updateData(bean);
		String message="";
		if(cnt==1){//수정 성공
			//new ProductListController().doGet(request, response);
		}else{//수정 실패	
			new MemberUpdateController().doGet(request, response);
		}
	}
}
