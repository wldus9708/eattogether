package com.eattogether.controller.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Manger;
import com.eattogether.model.dao.MangerDao;
import com.eattogether.utility.Paging;

public class ManagerListController extends Superclass {
	private final String PREFIX = "manager/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("관리자 메인페이지 및 회원관리 페이지로 이동합니다.");
		super.doGet(request, response);
		
		// 페이징 처리를 위한 파라미터 목록들
				String pageNumber = request.getParameter("pageNumber");
				String pageSize = request.getParameter("pageSize");
				String mode = request.getParameter("mode");
				String keyword = request.getParameter("keyword");		
				
				MangerDao dao = new MangerDao();
				
				int totalCount = dao.getTotalRecordCount("Members", mode, keyword);
				String url = super.getUrlInformation("manList") ;
				boolean isGrid = false ;
				
				Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
				
					
				List<Manger> dataList = dao.getDataList(paging);
				
				request.setAttribute("paging", paging); // 페이징 객체도 바인딩
				request.setAttribute("dataList", dataList);
		
		super.gotoPage(PREFIX + "manList.jsp");
	}
}
