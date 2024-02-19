package com.eattogether.controller.member;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.KakaoApi;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

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
       

            if (bean.getId() != null) {
            	session.setAttribute("loginfo",bean);
                session.setAttribute("email", bean.getId());
                session.setAttribute("nickName", bean.getName());
                session.setAttribute("access_Token", access_Token);

                System.out.println("access_Token : " + access_Token);
                System.out.println("nickname : " + bean.getName());
                System.out.println("email : " + bean.getId());
            }
            super.session.setAttribute("email", bean.getId());
            super.session.setAttribute("access_Token", access_Token);
            MemberDao dao = new MemberDao();
            int cnt = dao.getDataById(bean.getId()); // cnt 값 설정
            int kakaoChk = dao.getDataByKakaoIdChk(bean.getId());
            String message = ""; // 메시지 초기화

            if (cnt == 1 && kakaoChk == 1) { // cnt가 1일 때의 처리
            	cnt = dao.insertKakaoData(bean);
            	
            	session.setAttribute("loginfo",bean);
            	System.out.println(bean);
            	System.out.println("카카오 회원가입 결과[1] 새 회원가입, [2] 기존회원 로그인 : " + cnt);
                message = bean.getName() + "님 카카오 가입을 환영합니다.\n마이페이지에서 추가정보를 입력해주세요.";
                String encodedMessage = URLEncoder.encode(message, "UTF-8").replaceAll("\\+", "%20");
                String alertScript = "<script>alert(decodeURIComponent('" + encodedMessage + "')); window.location.href = 'member/meUpdate.jsp';</script>";
                response.getWriter().write(alertScript);
            } else if(cnt == 2 && kakaoChk == 2) { // cnt가 1이 아닐 때의 처리
            	System.out.println("카카오 회원가입 결과[1] 새 회원가입, [2] 기존회원 로그인 : " + cnt);
            	
            	session.setAttribute("loginfo", bean);
            	System.out.println(bean);
                message = bean.getName() + "님 카카오 로그인 하셨습니다.";
                String encodedMessage = URLEncoder.encode(message, "UTF-8").replaceAll("\\+", "%20");
                String alertScript = "<script>alert(decodeURIComponent('" + encodedMessage + "')); window.location.href = 'common/main.jsp';</script>";
                response.getWriter().write(alertScript);
            } else {
            	System.out.println("일반회원으로 이미 가입한 계정이 있어서 카카오 회원가입 실패");
        		message = "일반회원으로 이미 가입하신 아이디 입니다.\n일반회원으로 로그인 해주세요.";
            	 String encodedMessage = URLEncoder.encode(message, "UTF-8").replaceAll("\\+", "%20");
                 String alertScript = "<script>alert(decodeURIComponent('" + encodedMessage + "')); window.location.href = 'member/login.jsp';</script>";
                 response.getWriter().write(alertScript);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
