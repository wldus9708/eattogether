package com.eattogether.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.SHA256Encryption;
import com.eattogether.model.dao.MemberDao;


// 회원 가입 컨트롤러 
public class MemberInsertController extends Superclass {
    private final String PREFIX = "member/";
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("회원가입 페이지로 이동합니다.");
        super.doGet(request, response);
        super.gotoPage(PREFIX + "meInsertForm.jsp");
    }
    
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
        super.doPost(request, response);
        
        MemberDao dao = new MemberDao();
        Member bean = new Member();
        
        bean.setId(request.getParameter("id"));
        bean.setName(request.getParameter("name"));
        bean.setAlias(request.getParameter("alias"));
        System.out.println("암호화전 비밀번호 : " + request.getParameter("password"));
        // 비밀번호를 SHA256으로 암호화 나중에 주석 해제예정
        //bean.setPassword(SHA256Encryption.encrypt(request.getParameter("password")));
        bean.setPassword(request.getParameter("password"));
        System.out.println("암호화후 비밀번호 : " + bean.getPassword());
        bean.setBirth(request.getParameter("birth"));
        bean.setPhone(request.getParameter("phone"));
        
        String taste = "";
        String[] tastes = request.getParameterValues("taste");
        if (tastes == null) {
            taste = null;
        } else { // 음식 체크박스 마지막 요소에는 ,가 안생기게 설정
            for (int i = 0; i < tastes.length; i++) {
                if(tastes.length-1 == i) {
                    taste += tastes[i];
                }else {
                    taste += tastes[i] + ",";
                }
            }
        }
        bean.setTaste(taste);
        
        // DB에 회원 정보 저장
        int cnt = dao.insertData(bean);

        if (cnt == 1) { // 인서트 성공
            // 가입 축하 페이지로 이동 예정
            new MemberSuccessController().doGet(request, response);
        } else {// 인서트 실패
            new MemberInsertController().doGet(request, response);
        }
        
    }
}
