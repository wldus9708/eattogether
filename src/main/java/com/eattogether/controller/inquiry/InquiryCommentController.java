package com.eattogether.controller.inquiry;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Inquiry;
import com.eattogether.model.dao.InquiryDao;
import com.eattogether.utility.Paging;

public class InquiryCommentController extends Superclass {
	private final String PREFIX = "inquiry/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		final Integer MAX_GROUPNO_COUNT = 5;
		
		String id=request.getParameter("id");
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		InquiryDao dao = new InquiryDao();
		int totalCount = dao.getTotalRecordCount("Inquiry", mode, keyword);
		String url = super.getUrlInformation("inquList");
		boolean isGrid = false;
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
		List<Inquiry> dataList = dao.getDataList(paging);
		Integer inq_groupno = Integer.parseInt(request.getParameter("inq_groupno"));
		System.out.println("inq_groupno"+inq_groupno);
		Integer replyCount = 0; // 총답글의 개수
		List<Inquiry> testdata=dao.getReply();
		
		request.setAttribute("paging", paging);
		request.setAttribute("dataList", dataList);
		replyCount = dao.getReplyCount(inq_groupno);
		request.setAttribute("testinq", testdata);
		if (replyCount >= MAX_GROUPNO_COUNT) {
			String message = "답글은 하나만 가능합니다.";
			super.setAlertMessage(message);
			new InquiryListController().doGet(request, response);
		} else {
			super.gotoPage(PREFIX + "inquList.jsp");
		}
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		String mem_id = request.getParameter("mem_id");
		String inq_content = request.getParameter("inq_content");
		String inq_reply = request.getParameter("inq_reply");
		Integer inq_groupno = Integer.parseInt(request.getParameter("inq_groupno")) ;
		Integer inq_orderno = Integer.parseInt(request.getParameter("inq_orderno")) ;
		
		Inquiry bean = new Inquiry();
		
		bean.setMem_id(mem_id);
		bean.setInq_content(inq_content);
		bean.setInq_reply(inq_reply);
		bean.setInq_groupno(inq_groupno);
		bean.setInq_orderno(inq_orderno+1);
		
		InquiryDao dao = new InquiryDao();
		
		int cnt = -1 ;
		cnt = dao.replyData(bean, inq_orderno); 
		
		if(cnt == 1){ // 답글 작성 성공
			new InquiryCommentController().doGet(request, response);
		}else{
			new InquiryListController().doGet(request, response);
		}

	}

}
