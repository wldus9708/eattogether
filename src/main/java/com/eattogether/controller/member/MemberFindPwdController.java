package com.eattogether.controller.member;

import java.security.SecureRandom;
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
        
        MemberDao dao = new MemberDao(); // MemberDao 객체 생성
        Member bean = dao.getDataByIdAndPhoneAndName(id, phone, name); // 아이디, 전화번호, 이름으로 회원 정보 조회
        System.out.println(bean); // 조회된 회원 정보 출력
        if (bean == null) { // 회원 정보가 없는 경우
            setAlertMessage("입력하신 정보가 맞지 않습니다");
            super.gotoPage("member/findPassword.jsp"); 
        } else { // 회원 정보가 있는 경우
            String recipient_id = "eattogethers@naver.com"; // 발신자 이메일 주소
            String password = "abc1234!@"; // 발신자 이메일 비밀번호
            
            String recipient_email = bean.getId(); // 수신자 이메일 주소
            Properties props = new Properties(); // 속성 객체 생성
            props.put("mail.smtp.host", "smtp.naver.com"); // SMTP 호스트 설정
            props.put("mail.smtp.port", "465"); // SMTP 포트 설정
            props.put("mail.smtp.auth", "true"); // SMTP 인증 설정
            props.put("mail.smtp.ssl.enable", "true"); // SSL 사용 설정
            props.put("mail.smtp.starttls.enable", "true"); // STARTTLS 사용 설정
            props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // SSL 프로토콜 설정
            
            // 랜덤 비밀번호 생성
            String temporaryPassword = generateRandomPassword(); // 임시 비밀번호 생성
            System.out.println(temporaryPassword); // 생성된 임시 비밀번호 콘솔 출력
            
            // 이메일 전송
            sendEmail(recipient_id, password, recipient_email, bean.getName(), temporaryPassword);
            
            // 세션에 임시 비밀번호 저장
            HttpSession session = request.getSession(); // 현재 요청에 대한 세션 가져오기
            session.setAttribute("temporaryPassword", temporaryPassword); // 임시 비밀번호 세션에 저장
            request.setAttribute("id", id); // 아이디 속성 설정
            request.getRequestDispatcher("member/findPassword.jsp").forward(request, response); 
        }
    }

    // 랜덤 비밀번호 생성 메서드
    private String generateRandomPassword() { // 랜덤 비밀번호 생성 메소드 선언
        SecureRandom random = new SecureRandom(); // SecureRandom 객체 생성
        StringBuilder sb = new StringBuilder(); // StringBuilder 객체 생성
        String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; // 대문자 알파벳
        String lowerCase = "abcdefghijklmnopqrstuvwxyz"; // 소문자 알파벳
        String digits = "0123456789"; // 숫자
        String specialChars = "!@#$%^&*-_=?~"; // 특수문자

        String allChars = upperCase + lowerCase + digits + specialChars; // 모든 문자 조합
        for (int i = 0; i < 8; i++) { // 8자리 임시 비밀번호 생성
            int index = random.nextInt(allChars.length()); // 랜덤 인덱스 생성
            sb.append(allChars.charAt(index)); // 임시 비밀번호에 문자 추가
        }
        return sb.toString(); // 임시 비밀번호 반환
    }

    // 이메일 전송 메서드
    private void sendEmail(String recipient_id, String password, String recipient_email, String name, String temporaryPassword) { // 이메일 전송 메소드 선언
        Properties props = new Properties(); // 속성 객체 생성
        props.put("mail.smtp.host", "smtp.naver.com"); // SMTP 호스트 설정
        props.put("mail.smtp.port", "465"); // SMTP 포트 설정
        props.put("mail.smtp.auth", "true"); // SMTP 인증 설정
        props.put("mail.smtp.ssl.enable", "true"); // SSL 사용 설정
        props.put("mail.smtp.starttls.enable", "true"); // STARTTLS 사용 설정
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // SSL 프로토콜 설정

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { // 세션 생성
            protected PasswordAuthentication getPasswordAuthentication() { // 비밀번호 인증
                return new PasswordAuthentication(recipient_id, password); // 발신자 이메일 인증 정보 반환
            }
        });

        try { // 예외 처리
            MimeMessage msg = new MimeMessage(session); // MIME 메시지 객체 생성
            msg.setFrom(new InternetAddress(recipient_id, "(주)오늘 뭐먹지?")); // 발신자 설정
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient_email)); // 수신자 설정
            
            // 메일 제목 설정
            msg.setSubject("오늘 뭐먹지?에 요청하신 "+ name + " 님의 임시비밀번호 입니다.");
            
            // 메일 내용 설정
            String message = String.format("안녕하세요 %s 회원님!\n\n" +
                                            "비밀번호찾기 요청에 따라 임시 비밀번호를 발급해 드립니다.\n" +
                                            "임시 비밀번호는  %s  입니다.\n" +
                                            "임시 비밀번호로 로그인하시고 마이페이지에서 비밀번호 수정 부탁드립니다.\n\n" +
                                            "--------------------------------------------------------------------\n" +
                                            "감사합니다!\n" +
                                            "(주)오늘 뭐먹지?", name, temporaryPassword);
            msg.setText(message); // 메일 내용 설정
            
            Transport.send(msg); // 메일 전송
            System.out.println("이메일로 임시 비밀번호 전송 성공"); 
        } catch (Exception e) { 
            e.printStackTrace(); 
            System.out.println("이메일로 임시 비밀번호 전송 실패"); 
        }
    }
}