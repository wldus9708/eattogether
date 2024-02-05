package com.eattogether.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Notice;
import com.eattogether.model.dao.NoticeDao;

public class NoticeInsertController extends Superclass{
	private final String PREFIX = " notice/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		super.gotoPage(PREFIX + "noticeInsert.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		NoticeDao dao = new NoticeDao();
		Notice bean  = new Notice();
		
		int not_no = Integer.parseInt(request.getParameter("not_no"));
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int not_header = Integer.parseInt(request.getParameter("not_header"));
		int not_content = Integer.parseInt(request.getParameter("not_content"));
		int not_redate = Integer.parseInt(request.getParameter("not_redate"));
		
		bean.setNot_no(not_no);
		bean.setMem_no(mem_no);
		bean.setNot_header(not_header);
		bean.setNot_content(not_content);
		bean.setNot_redate(not_redate);
		
		int cnt = -1 ;
		cnt = dao.insertData(bean); 
		if(cnt == 1){ // 인서트 성공
			new NoticeListController().doGet(request, response) ;
			
		}else{ // 인서트 실패
			new NoticeInsertController().doGet(request, response);
		}
		
	}
}
