package com.eattogether.model.bean;

public class Member {
	private String id; // 아이디
	private String name; // 이름
	private String alias; // 닉네임
	private String password; // 비밀번호
	private String social_key; // 소셜로그인 키
	private String social_host; // 소셜 로그인 호스트
	private String birth; // 생년월일
	private String phone; // 전화번호
	private String taste; // 음식취향
	private String picture; // 프로필 사진
	private String flag; // 사용자 유형(회원 : 1, 관리자 : 2)

	public Member() {
	}

	public Member(String id, String name, String alias, String password, String social_key, String social_host,
			String birth, String phone, String taste, String picture, String flag) {
		super();
		this.id = id;
		this.name = name;
		this.alias = alias;
		this.password = password;
		this.social_key = social_key;
		this.social_host = social_host;
		this.birth = birth;
		this.phone = phone;
		this.taste = taste;
		this.picture = picture;
		this.flag = flag;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSocial_key() {
		return social_key;
	}

	public void setSocial_key(String social_key) {
		this.social_key = social_key;
	}

	public String getSocial_host() {
		return social_host;
	}

	public void setSocial_host(String social_host) {
		this.social_host = social_host;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", alias=" + alias + ", password=" + password + ", social_key="
				+ social_key + ", social_host=" + social_host + ", birth=" + birth + ", phone=" + phone + ", taste="
				+ taste + ", picture=" + picture + ", flag=" + flag + "]";
	}

}
