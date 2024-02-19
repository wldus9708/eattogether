package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.SHA256Encryption;
import com.eattogether.model.dao.MemberDao;
import com.oreilly.servlet.MultipartRequest;


public class MemberUpdateController extends Superclass{
	private final String PREFIX="member/";
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		String id=request.getParameter("id");

		System.out.println(id);
		MemberDao dao =new MemberDao();
		Member bean=dao.getDataBean(id);
		System.out.println("doget");
		System.out.println(bean);
		request.setAttribute("bean", bean);
		super.gotoPage(PREFIX+"meUpdate.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		MemberDao dao = new MemberDao();
		Member bean = new Member();
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");	
		bean.setId(mr.getParameter("id"));
		bean.setName(mr.getParameter("name"));
		bean.setAlias(mr.getParameter("alias"));
		//bean.setPassword(mr.getParameter("password"));
		// 비밀번호를 SHA256으로 암호화 나중에 주석 해제예정
	    bean.setPassword(SHA256Encryption.encrypt(mr.getParameter("password")));
		bean.setPhone(mr.getParameter("phone"));
		String taste = "";
        String[] tastes = mr.getParameterValues("taste");
        if (tastes == null) {
            taste = null;
        } else { // 음식 체크박스 마지막 요소에는 ,가 안생기게 설정
            for (int i = 0; i < tastes.length; i++) {
                if(tastes.length-1 == i) {
                    taste += tastes[i];
                }else {
                    taste += tastes[i] + ",";
                }
            }
        }
        bean.setTaste(taste);
		bean.setPicture(mr.getFilesystemName("picture"));
		System.out.println("post");
		System.out.println(bean);
		
		int cnt =-1;
		cnt=dao.updateData(bean);
		if(cnt==1){//수정 성공
			super.session.setAttribute("loginfo", bean);
			new MemberListController().doGet(request, response);
		}else{//수정 실패	
			new MemberUpdateController().doGet(request, response);
		}
	}
	
}
