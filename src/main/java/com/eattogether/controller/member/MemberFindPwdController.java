package com.eattogether.controller.member;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eattogether.common.Superclass;
import com.eattogether.model.bean.Member;
import com.eattogether.model.dao.MemberDao;

public class MemberFindPwdController extends Superclass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByIdAndPhoneAndName(id, phone, name);
		System.out.println(bean);		
		if (bean == null) {
			setAlertMessage("아이디나 이메일 정보가 맞지 않습니다");
			super.gotoPage("member/findPassword.jsp");
		}
		
        String user = "eattogethers@naver.com";
        String password = "abc1234!@";
        
        String to_email = bean.getId();
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
		String randomPwd="";
		//임시비밀번호 만들기
		StringBuffer sb = new StringBuffer();
		StringBuffer sc = new StringBuffer("!@#$%^&*-=?~");// 특수문자 이상한거는 뺌
		// 대문자
		sb.append((char)((Math.random() * 26)+65)); // 첫글자 대문자

		for( int i = 0; i<3; i++) {
			sb.append((char)((Math.random() * 26)+65));
		} 
		// 소문자 4개
		for( int i = 0; i<4; i++) {
			sb.append((char)((Math.random() * 26)+97));
		}  
		// 숫자 2개
		for( int i = 0; i<2; i++) {
			sb.append((char)((Math.random() * 10)+48));
		}
		// 특수문자를 두개  발생시켜 랜덤하게 중간에 끼워 넣는다
		
		//대문자3개중 하나
		sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt((int)(Math.random()*sc.length()-1))); 
		
		//소문자4개중 하나
		sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt((int)(Math.random()*sc.length()-1))); 
		randomPwd = sb.toString();

        String AuthenticationKey = sb.toString();
        System.out.println(AuthenticationKey);
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        
        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(user, "(주)오늘 뭐먹지?"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            
            //메일 제목
            msg.setSubject("오늘 뭐먹지?에 요청하신 "+bean.getName()+ " 님의 임시비밀번호 입니다.");
            
            //메일 내용
            msg.setText("안녕하세요 "+bean.getName()+" 회원님!\n\n"
					+"비밀번호찾기 요청에 따라 임시 비밀번호를 발급해 드립니다.\n"
					+"임시 비밀번호는  "+randomPwd+"  입니다.\n"
					+"임시 비밀번호로 로그인하시고 마이페이지에서 비밀번호 수정 부탁드립니다.\n\n"
					+"--------------------------------------------------------------------\n"
					+"감사합니다!\n"
					+ "(주)오늘 뭐먹지?");
            
            Transport.send(msg);
            System.out.println("이메일 전송 성공");
            
        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("이메일 전송 실패");
        }
        HttpSession saveKey = request.getSession();
        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
        request.setAttribute("id", id);
        request.getRequestDispatcher("member/findPassword.jsp").forward(request, response);
	}
}
