package com.eattogether.controller.inquiry;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Inquiry;
import com.eattogether.model.dao.InquiryDao;
import com.eattogether.utility.Paging;

public class InquiryListController extends Superclass{
	private final String PREFIX = "inquiry/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		System.out.println("문의사항 페이지로 이동합니다.");
		String id=request.getParameter("id");
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		InquiryDao dao = new InquiryDao();
		List<Inquiry> testdata=dao.getReply();
		
		request.setAttribute("testinq", testdata);
		
		int totalCount = dao.getTotalRecordCount("Inquiry", mode, keyword);
		String url = super.getUrlInformation("inquList");
		boolean isGrid = false;
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
		System.out.println(paging);
		List<Inquiry> dataList = dao.getDataList(paging);
		/* Inquiry bean=dao.getdatareply(id); */
		System.out.println("문의사항 : " + dataList.size());
		
		request.setAttribute("paging", paging);
		request.setAttribute("dataList", dataList);
		/* request.setAttribute("rbean", bean); */
		super.gotoPage(PREFIX + "inquList.jsp");
	}

}
