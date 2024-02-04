package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

// 회원 가입 컨트롤러 
public class MemberInsertController extends Superclass {
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("회원가입 페이지로 이동합니다.");
		super.doGet(request, response);
		super.gotoPage(PREFIX + "meInsertForm.jsp");
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MemberDao dao = new MemberDao();
		Member bean = new Member();
		
		bean.setId(request.getParameter("id"));
		bean.setName(request.getParameter("name"));
		bean.setAlias(request.getParameter("alias"));
		bean.setPassword(request.getParameter("password"));
		bean.setBirth(request.getParameter("birth"));
		bean.setPhone(Integer.parseInt(request.getParameter("phone")));
		bean.setTaste(request.getParameter("taste"));
		
		String taste = "";
		String[] tastes = request.getParameterValues("taste");
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
		int cnt = dao.insertData(bean);

		if (cnt == 1) { // 인서트 성공
			// 가입 축하 페이지로 이동 예정
			new MemberSuccessController().doGet(request, response);
		} else {// 인서트 실패
			new MemberInsertController().doGet(request, response);
		}
		
	}
}
