package com.eattogether.model.bean;

public class Manger {
	private int mem_no;
	private String mem_id;
	private String mem_name;
	private String mem_alias;
	private String mem_birth;
	private String mem_phone;
	private String mem_taste;
	private String mem_flag;
	@Override
	public String toString() {
		return "Manger [mem_no=" + mem_no + ", mem_id=" + mem_id + ", mem_name=" + mem_name + ", mem_alias=" + mem_alias
				+ ", mem_birth=" + mem_birth + ", mem_phone=" + mem_phone + ", mem_taste=" + mem_taste + ", mem_flag="
				+ mem_flag + "]";
	}
	public Manger() {
		// TODO Auto-generated constructor stub
	}
	public Manger(int mem_no, String mem_id, String mem_name, String mem_alias, String mem_birth, String mem_phone,
			String mem_taste, String mem_flag) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_alias = mem_alias;
		this.mem_birth = mem_birth;
		this.mem_phone = mem_phone;
		this.mem_taste = mem_taste;
		this.mem_flag = mem_flag;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_alias() {
		return mem_alias;
	}
	public void setMem_alias(String mem_alias) {
		this.mem_alias = mem_alias;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_taste() {
		return mem_taste;
	}
	public void setMem_taste(String mem_taste) {
		this.mem_taste = mem_taste;
	}
	public String getMem_flag() {
		return mem_flag;
	}
	public void setMem_flag(String mem_flag) {
		this.mem_flag = mem_flag;
	}
	
	
	
}