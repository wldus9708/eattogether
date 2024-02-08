package com.eattogether.controller.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Notice;
import com.eattogether.model.dao.NoticeDao;
import com.eattogether.utility.Paging;

public class NoticeListController extends Superclass{
	private final String PREFIX = "notice/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		System.out.println("공지사항 목록 페이지로 이동합니다.");

		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		NoticeDao dao = new NoticeDao();
		
		int totalCount = dao.getTotalRecordCount("Notice", mode, keyword);
		String url = super.getUrlInformation("notiList");
		boolean isGrid = false;
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
		List<Notice> dataList = dao.getDataList(paging);
		
		System.out.println("공지사항 : " + dataList.size());
		
		request.setAttribute("paging", paging);
		request.setAttribute("dataList", dataList);
		
		super.gotoPage(PREFIX + "mangernotiList.jsp");
		
	}
}
