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
import com.eattogether.model.bean.SHA256Encryption;
import com.eattogether.model.dao.MemberDao;

public class MemberFindPwdController extends Superclass {
	// 이메일 인증 정보
	private static final String RECIPIENT_ID = "eattogethers@naver.com";
	private static final String PASSWORD = "abc1234!@";

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		int kakaoChk = 0;
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByIdAndPhoneAndName(id, phone, name);
		kakaoChk= dao.getDataByKakaoIdChk(id);
		System.out.println(bean);
		if (bean == null) {
			setAlertMessage("입력하신 정보가 맞지 않습니다");
			super.gotoPage("member/findPassword.jsp");
		} else {

			if (kakaoChk != dao.USABLE_ID) {
				setAlertMessage("해당 아이디는 카카오계정으로 가입된 아이디 입니다.\n일반회원으로 가입된 계정만 이용가능한 서비스 입니다.");
				super.gotoPage("member/findPassword.jsp");
			} else {
				// 랜덤 비밀번호 생성

				String temporaryPassword = generateRandomPassword();
				String hashedPassword = SHA256Encryption.encrypt(temporaryPassword);
				System.out.println("랜덤으로 생성된 임시 비밀번호 : " + temporaryPassword);
				System.out.println("랜덤으로 생성된 암호화 된 임시 비밀번호 : " + hashedPassword);

				// 이메일 전송
				boolean emailSent = sendEmail(RECIPIENT_ID, PASSWORD, bean.getId(), bean.getName(), temporaryPassword);
				if (emailSent) {
					System.out.println("이메일로 임시 비밀번호 전송 성공");
					// 비밀번호 업데이트

					// boolean updateSuccess = dao.tempPassword(id, temporaryPassword);
					// 암호화된 비밀번호
					boolean updateSuccess = dao.tempPassword(id, hashedPassword);
					if (updateSuccess) {
						System.out.println("임시 비밀번호로 업데이트 성공");
						// 세션에 임시 비밀번호 업데이트 성공 플래그 설정
						HttpSession session = request.getSession();
						session.setAttribute("temporaryPasswordUpdated", true);
					} else {
						System.out.println("임시 비밀번호로 업데이트 실패");
					}
				} else {
					System.out.println("이메일로 임시 비밀번호 전송 실패");
				}

				// 세션에 임시 비밀번호 저장
				HttpSession session = request.getSession();
				session.setAttribute("temporaryPassword", temporaryPassword);
				request.setAttribute("id", id);
				response.sendRedirect("member/findPassword.jsp");
			}
		}

	}

	// 랜덤 비밀번호 생성 메서드
	private String generateRandomPassword() {
		SecureRandom random = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerCase = "abcdefghijklmnopqrstuvwxyz";
		String digits = "0123456789";
		String specialChars = "!@#$%^&*-_=?~";

		String allChars = upperCase + lowerCase + digits + specialChars;
		for (int i = 0; i < 8; i++) {
			int index = random.nextInt(allChars.length());
			sb.append(allChars.charAt(index));
		}
		return sb.toString();
	}

	// 이메일 전송 메서드
	private boolean sendEmail(String recipient_id, String password, String recipient_email, String name,
			String temporaryPassword) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(recipient_id, password);
			}
		});

		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(recipient_id, "(주)오늘 뭐먹지?"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient_email));

			msg.setSubject("오늘 뭐먹지?에 요청하신 " + name + " 님의 임시비밀번호 입니다.");

			String message = String.format("안녕하세요 %s 회원님!\n\n" + "비밀번호찾기 요청에 따라 임시 비밀번호를 발급해 드립니다.\n"
					+ "임시 비밀번호는  %s  입니다.\n" + "임시 비밀번호로 로그인하시고 마이페이지에서 비밀번호 수정 부탁드립니다.\n\n"
					+ "--------------------------------------------------------------------\n" + "감사합니다!\n"
					+ "(주)오늘 뭐먹지?", name, temporaryPassword);
			msg.setText(message);

			Transport.send(msg);
			return true; // 이메일 전송 성공
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 이메일 전송 실패
		}
	}
}
