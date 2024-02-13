package com.eattogether.model.bean;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256Encryption {
	 public static String encrypt(String password) {
	        try {
	            // SHA-256 해시 함수를 사용하여 MessageDigest 인스턴스 생성
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            
	            // 비밀번호를 바이트 배열로 변환하여 해싱
	            byte[] hashedBytes = md.digest(password.getBytes());
	            
	            // 해싱된 바이트 배열을 16진수 문자열로 변환
	            StringBuilder sb = new StringBuilder();
	            for (byte b : hashedBytes) {
	                sb.append(String.format("%02x", b));
	            }
	            
	            // 16진수 문자열 반환
	            return sb.toString();
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
