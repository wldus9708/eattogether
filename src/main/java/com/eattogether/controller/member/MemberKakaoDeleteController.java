package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.KakaoApi;
import com.eattogether.model.dao.MemberDao;

public class MemberKakaoDeleteController extends Superclass {
	private final KakaoApi kakaoApi = new KakaoApi();
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		String id=request.getParameter("id");
		
		String access_Token = (String)session.getAttribute("access_Token");
		System.out.println(id);
		MemberDao dao=new MemberDao();
		int cnt=-1;
		cnt=dao.deleteData(id);
		if(cnt!=-1) {
			System.out.println("카카오 회원 탈퇴성공");
			kakaoApi.unlink(access_Token);
			super.session.invalidate();
		new MemberLogoutController().doGet(request, response);
		}else {
			System.out.println("카카오 회원탈퇴실패");
		super.gotoPage("member/meList.jsp");
		}
	}


}
