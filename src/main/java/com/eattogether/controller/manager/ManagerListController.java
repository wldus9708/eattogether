package com.eattogether.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;

public class ManagerListController extends Superclass {
	private final String PREFIX = "manager/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("관리자 메인페이지 및 회원관리 페이지로 이동합니다.");
		super.doGet(request, response);
		super.gotoPage(PREFIX + "manList.jsp");
	}
}
