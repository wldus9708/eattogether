package com.eattogether.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.combo02;
import com.eattogether.model.dao.MemberDao;

public class MemberDetailController extends Superclass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		int rec_no=Integer.valueOf(request.getParameter("rec_no"));
		
		MemberDao dao = new MemberDao();
		List<combo02> cdataList=dao.getDataList4(rec_no);
		Member bean=dao.getData5(rec_no);
		request.setAttribute("cdataList", cdataList);
		request.setAttribute("mbean", bean);
		super.gotoPage("member/Submypage2.jsp");
	}

}
