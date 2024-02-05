package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;


public class MemberLogoutController extends Superclass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);


		if (super.loginfo != null) { //로그인 한 경우
			
			super.session.invalidate(); // 세션 데이터들을 무효화
			super.gotoPage("member/login.jsp"); // 로그인 페이지로 다시 이동
		}else { // 미로그인 상태
			super.youNeededLogin();
			return;
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	}
}
