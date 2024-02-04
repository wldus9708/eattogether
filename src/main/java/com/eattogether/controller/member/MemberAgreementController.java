package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

// 회원 가입 컨트롤러 
public class MemberAgreementController extends Superclass {
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("회원가입 약관 페이지로 이동합니다.");
		super.doGet(request, response);
		super.gotoPage(PREFIX + "memberAgreement.jsp");
	}
	
}
