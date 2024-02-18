package com.eattogether.controller.inquiry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Inquiry;
import com.eattogether.model.dao.InquiryDao;

public class InquiryInsertController extends Superclass {
	private final String PREFIX = "inquiry/" ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
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
