package com.eattogether.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.KakaoApi;
import com.eattogether.model.bean.Member;

public class MemberKakaoLoginController extends Superclass {
	private final KakaoApi kakaoApi = new KakaoApi();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		try {
			String code = request.getParameter("code");

			System.out.println("코드 : " + code);
			String access_Token = kakaoApi.getToken(code);
			Member bean = kakaoApi.getKakaoUserInfo(access_Token);
			super.session.setAttribute("loginfo", bean);

			if (bean.getId() != null) {
				session.setAttribute("email", bean.getId());
				session.setAttribute("nickName", bean.getAlias());
				session.setAttribute("access_Token", access_Token);

				System.out.println("access_Token : " + access_Token);
				System.out.println("nickname : " + bean.getAlias());
				System.out.println("email : " + bean.getId());
			}
			super.session.setAttribute("email", bean.getId());
			super.session.setAttribute("access_Token", bean.getId());
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("var alias = '" + bean.getAlias() + "';");
			out.println("alert(alias + '님 카카오 로그인하셨습니다.');");
			out.println("location.href='common/main.jsp';");
			out.println("</script>");
            return; 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}

	}

	
}
