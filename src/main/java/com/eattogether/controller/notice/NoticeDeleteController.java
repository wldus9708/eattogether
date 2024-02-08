package com.eattogether.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.dao.NoticeDao;


public class NoticeDeleteController extends Superclass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int noti_no = Integer.parseInt(request.getParameter("noti_no")) ;
		NoticeDao dao = new NoticeDao() ;
		int cnt = -1;
		cnt = dao.deleteData(noti_no);		

		new NoticeListController().doGet(request, response); 
	}
}
