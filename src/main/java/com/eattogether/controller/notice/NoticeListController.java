package com.eattogether.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;

public class NoticeListController extends Superclass{
	private final String PREFIX = "notice/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int not_no = Integer.parseInt(request.getParameter("not_no"));
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int not_header = Integer.parseInt(request.getParameter("not_header"));
		int not_content = Integer.parseInt(request.getParameter("not_content"));
		int not_redate = Integer.parseInt(request.getParameter("not_redate"));
		
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	}
}
