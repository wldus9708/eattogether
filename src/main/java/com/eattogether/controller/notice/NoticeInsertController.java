package com.eattogether.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Notice;
import com.eattogether.model.dao.NoticeDao;

public class NoticeInsertController extends Superclass{
	private final String PREFIX = "notice/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		super.gotoPage(PREFIX + "notiInsert.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		NoticeDao dao = new NoticeDao();
		Notice bean  = new Notice();
		

		String mem_id = request.getParameter("id");
		String noti_header = request.getParameter("noti_header");
		String noti_content = request.getParameter("noti_content");

		bean.setMem_id(mem_id);
		bean.setNoti_header(noti_header);
		bean.setNoti_content(noti_content);
		
		 int cnt = dao.insertData(bean); 
		if(cnt == 1){ // 인서트 성공
			new NoticeListController().doGet(request, response) ;
			
		}else{ // 인서트 실패
			new NoticeInsertController().doGet(request, response);
		}
		
	}
}
