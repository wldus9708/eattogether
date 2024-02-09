package com.eattogether.model.bean;

public class Notice {
	private int noti_no;
	private String mem_id;
	private String noti_header;
	private String noti_content;
	private String noti_regdate;

	public Notice() {
	}

	public Notice(int noti_no, String mem_id, String noti_header, String noti_content, String noti_regdate) {
		super();
		this.noti_no = noti_no;
		this.mem_id = mem_id;
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

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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

	@Override
	public String toString() {
		return "Notice [noti_no=" + noti_no + ", mem_id=" + mem_id + ", noti_header=" + noti_header + ", noti_content="
				+ noti_content + ", noti_regdate=" + noti_regdate + "]";
	}

}