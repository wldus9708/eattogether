package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;

public class MemberSuccessController extends Superclass {
	private final String PREFIX = "member/";

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("회원가입 축하 페이지로 이동합니다.");
		super.doGet(request, response);

		super.gotoPage(PREFIX + "joinSuccess.jsp");
	}

}
