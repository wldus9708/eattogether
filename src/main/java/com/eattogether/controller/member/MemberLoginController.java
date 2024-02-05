package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

public class MemberLoginController extends Superclass {
	private final String PREFIX = "member/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그인 페이지로 이동합니다.");
		super.doGet(request, response);
		super.gotoPage(PREFIX + "login.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println(id + "/" + password);

		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByIdAndPassword(id, password);
		System.out.println(bean);

		if (bean == null) {
			System.out.println( "로그인 정보가 잘못되었습니다.");
			String message = "로그인 정보가 잘못되었습니다.";
			super.setAlertMessage(message);
			super.gotoPage(PREFIX + "login.jsp");
		} else { // 로그인 성공
			// session 영역(scope)에 나의 로그인 정보를 저장(바인딩)합니다.
			// loginfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다.
			super.session.setAttribute("loginfo", bean);
			
			// 로그인 성공 이후 메인 페이지로 이동합니다.
			super.gotoPage("common/main.jsp");
		}
	}

}
