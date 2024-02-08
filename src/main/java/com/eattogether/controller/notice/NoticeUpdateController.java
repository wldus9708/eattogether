package com.eattogether.controller.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Notice;
import com.eattogether.model.dao.NoticeDao;

public class NoticeUpdateController extends Superclass{
	private final String PREFIX = "notice/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int noti_no = Integer.parseInt(request.getParameter("noti_no"));
		NoticeDao dao = new NoticeDao();
		Notice bean = dao.getDataBean(noti_no);
		
		request.setAttribute("bean", bean);
		
		super.gotoPage(PREFIX+"notiUpdate.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		NoticeDao dao = new NoticeDao();
		Notice bean = new Notice();
		
		int noti_no = Integer.parseInt(request.getParameter("noti_no"));
		String noti_header = request.getParameter("noti_header");
		String noti_content = request.getParameter("noti_content");
		
		bean.setNoti_no(noti_no);
		bean.setNoti_header(noti_header);
		bean.setNoti_content(noti_content);
		
		
		int cnt = -1 ;
		cnt = dao.updateData(bean);

		if(cnt == 1){ // 수정 성공
			new NoticeListController().doGet(request, response) ;
			
		}else{ // 수정 실패
			new NoticeUpdateController().doGet(request, response);
		}	
	}
}
