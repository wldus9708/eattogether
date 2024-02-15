package com.eattogether.controller.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.controller.manager.ManagerListController;
import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.SHA256Encryption;
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
		String checkbox = request.getParameter("checkbox");
		System.out.println("아이디 : " + id + "/ 암호화 전비밀번호 :" + password);
		System.out.println("아이디 저장 여부:" + checkbox);
		
		// 주석 나중에 해제 예정
		//String hashedPassword = SHA256Encryption.encrypt(password);


		MemberDao dao = new MemberDao();
		// 주석 나중에 해제 예정
		//Member bean = dao.getDataByIdAndPassword(id, hashedPassword);
		Member bean = dao.getDataByIdAndPassword(id, password);
		System.out.println(bean);

		if (bean == null) {
			System.out.println("로그인 정보가 잘못되었습니다.");
			String message = "로그인 정보가 잘못되었습니다.";
			super.setAlertMessage(message);
			super.gotoPage(PREFIX + "login.jsp");
		} else { // 로그인 성공
			// session 영역(scope)에 나의 로그인 정보를 저장(바인딩)합니다.
			// loginfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다.
			super.session.setAttribute("loginfo", bean);
			System.out.println("회원 유형 = 회원(1), 관리자(2) : " + bean.getFlag());
			
			if (checkbox != null) {
				Cookie cookie = new Cookie("checkbox", id);
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);
				System.out.println("아이디 저장 쿠키 생성완료");
			}else {
				Cookie noCookie = new Cookie("checkbox", "");
				noCookie.setMaxAge(0);
				response.addCookie(noCookie);
				System.out.println("아이디 저장 쿠키 생성 선택 안함");
			}
			
			
			Boolean temporaryPasswordUpdated = (Boolean) session.getAttribute("temporaryPasswordUpdated");
			if (temporaryPasswordUpdated != null && temporaryPasswordUpdated.booleanValue()) {
			    session.removeAttribute("temporaryPasswordUpdated");
			    String script = "<script>alert('임시 비밀번호로 로그인되었습니다. 비밀번호를 변경해주세요.'); window.location.href='" + request.getContextPath() + "/member/meUpdate.jsp';</script>";
			    response.setContentType("text/html;charset=UTF-8");
			    response.getWriter().println(script);
			    System.out.println("임시비밀번호로 로그인하여 비밀번호 변경 안내하며 마이페이지로 이동");
			}else {
	        	if (bean.getFlag().equals("1")) {
					System.out.println("회원 메인페이지로 이동합니다.");
					super.gotoPage("common/main.jsp");

				} else if (bean.getFlag().equals("2")) {
					System.out.println("관리자 메인페이지로 이동합니다.");
					new ManagerListController().doGet(request, response);
				}
	        }
			

			
		}
	}

}
