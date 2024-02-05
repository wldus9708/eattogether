package com.eattogether.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eattogether.model.bean.Member;

public class Superclass implements SuperController{
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	protected HttpSession session;
	// 로그인 여부를 파악하는 변수
	protected Member loginfo = null;
	
	public String getUrlInformation(String todoCommand) {
		// todoCommand : todolist.txt 파일에 명시된 커맨드 이름
		// 커맨드 이름을 사용하여 웹 주소 형식의 FullName을 반환해 줍니다.
		String appName = this.request.getContextPath(); // in file common.jsp
		String mappingName = "/Shopping"; // url Pattern in file FrontController

		String fullAddress = appName + mappingName + "?command=" + todoCommand;
		System.out.println("요청 url 전체 경로명 : \n" + fullAddress);

		return fullAddress;
	}
	
	public void youNeededLogin() {
		// 미로그인시 적절한 메세지를 보여 주고, 로그인 페이지로 이동합니다.
		String message = "로그인이 필요한 서비스 입니다.";
		this.setAlertMessage(message);
		this.gotoPage("member/meLoginForm.jsp");

	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		this.loginfo = (Member) session.getAttribute("loginfo");
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		this.loginfo = (Member) session.getAttribute("loginfo");
		
	}
	
	public void gotoPage(String gotoPage) {
		// 요청한 페이지 gotoPage로 이동합니다.
		if (this.request == null) {
			System.out.println("doGet/doPost() 메소드 호출 누락");
			return;
		}

		// 요청한 페이지로 포워딩합니다.
		RequestDispatcher dispatcher = null;
		try {
			dispatcher = request.getRequestDispatcher(gotoPage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setAlertMessage(String message) {
		// session 영역에서 "alertMessage" 라는 이름으로 사용자에게 주의/오류/경고 문구 등을 띄워줍니다.
		// in common.jsp 파일 하단 참조
		session.setAttribute("alertMessage", message);

	}

}
