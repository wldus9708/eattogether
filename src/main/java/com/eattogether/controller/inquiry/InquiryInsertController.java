package com.eattogether.controller.inquiry;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Inquiry;
import com.eattogether.model.dao.InquiryDao;
import com.eattogether.utility.Paging;

public class InquiryInsertController extends Superclass {
	private final String PREFIX = "inquiry/" ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
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
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		InquiryDao dao = new InquiryDao();
		Inquiry bean = new Inquiry();
		
		String mem_id = request.getParameter("mem_id");
		String inq_content = request.getParameter("inq_content");
		String inq_reply = request.getParameter("inq_reply");
		
		bean.setMem_id(mem_id);
		bean.setInq_content(inq_content);
		bean.setInq_reply(inq_reply);
		
		int cnt = dao.insertData(bean);
		if(cnt ==1) {
			new InquiryInsertController().doGet(request, response);
		}else {
			// 실패 시 현재 페이지로 redirect
	        new InquiryListController().doGet(request, response);
		}
	}

}
