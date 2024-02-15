package com.eattogether.controller.inquiry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Inquiry;
import com.eattogether.model.dao.InquiryDao;

public class InquiryInsertController extends Superclass {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		InquiryDao dao = new InquiryDao();
		Inquiry bean = new Inquiry();
		
		String mem_id = request.getParameter("id");
		String inq_content = request.getParameter("inq_content");
		
		bean.setMem_id(mem_id);
		bean.setInq_content(inq_content);
		
		int cnt = dao.insertData(bean);
		if(cnt ==1) {
			new InquiryListController().doGet(request, response);
		}else {
			// 실패 시 현재 페이지로 redirect
	        new InquiryListController().doGet(request, response);
		}
	}

}
