package com.eattogether.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

public class MemberListController extends Superclass{
	private final String PREFIX = "member/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		String id=request.getParameter("id");
		System.out.println(id);
		MemberDao dao = new MemberDao();	
		List<Member> dataList = dao.getDataList(id);

		request.setAttribute("dataList", dataList);
		super.gotoPage(PREFIX + "meList.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);

		super.gotoPage(PREFIX + "meList.jsp");
	}
}
