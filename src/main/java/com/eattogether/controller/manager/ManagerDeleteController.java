package com.eattogether.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.dao.MemberDao;

public class ManagerDeleteController extends Superclass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		MemberDao dao = new MemberDao() ;
		int cnt = -1;
		cnt = dao.deleteData(no);		

		new ManagerListController().doGet(request, response); 
	}

}
