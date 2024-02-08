package com.eattogether.model.bean;


public class Notice {
	private int noti_no;
	private int mem_no;
	private String noti_header;
	private String noti_content;
	private String noti_regdate;
	
	@Override
	public String toString() {
		return "Notice [noti_no=" + noti_no + ", mem_no=" + mem_no + ", noti_header=" + noti_header + ", noti_content="
				+ noti_content + ", noti_regdate=" + noti_regdate + "]";
	}
	
	
	
	public Notice(int noti_no, int mem_no, String noti_header, String noti_content, String noti_regdate) {
		super();
		this.noti_no = noti_no;
		this.mem_no = mem_no;
		this.noti_header = noti_header;
		this.noti_content = noti_content;
		this.noti_regdate = noti_regdate;
	}
	
	




	public int getNoti_no() {
		return noti_no;
	}



	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}



	public int getMem_no() {
		return mem_no;
	}



	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}



	public String getNoti_header() {
		return noti_header;
	}



	public void setNoti_header(String noti_header) {
		this.noti_header = noti_header;
	}



	public String getNoti_content() {
		return noti_content;
	}



	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}



	public String getNoti_regdate() {
		return noti_regdate;
	}



	public void setNoti_regdate(String noti_regdate) {
		this.noti_regdate = noti_regdate;
	}



	public Notice() {}
	

}
