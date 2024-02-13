package com.eattogether.model.bean;

public class Inquiry {
	private int inq_no;
	private String mem_id;
	private String inq_content;
	private String inq_regdate;
	
	public Inquiry() {
		
	}

	@Override
	public String toString() {
		return "Inquiry [inq_no=" + inq_no + ", mem_id=" + mem_id + ", inq_content=" + inq_content + ", inq_regdate="
				+ inq_regdate + "]";
	}

	public Inquiry(int inq_no, String mem_id, String inq_content, String inq_regdate) {
		super();
		this.inq_no = inq_no;
		this.mem_id = mem_id;
		this.inq_content = inq_content;
		this.inq_regdate = inq_regdate;
	}

	public int getInq_no() {
		return inq_no;
	}

	public void setInq_no(int inq_no) {
		this.inq_no = inq_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getInq_content() {
		return inq_content;
	}

	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}

	public String getInq_regdate() {
		return inq_regdate;
	}

	public void setInq_regdate(String inq_regdate) {
		this.inq_regdate = inq_regdate;
	}
	
	

}
