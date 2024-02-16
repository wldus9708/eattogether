package com.eattogether.model.bean;

public class Inquiry {
	private int inq_no;
	private String mem_id;
	private String inq_content;
	private String inq_regdate;
	private String inq_reply;
	private int inq_groupno;
	private int inq_orderno;

	public Inquiry() {

	}

	@Override
	public String toString() {
		return "Inquiry [inq_no=" + inq_no + ", mem_id=" + mem_id + ", inq_content=" + inq_content + ", inq_regdate="
				+ inq_regdate + ", inq_reply=" + inq_reply + ", inq_groupno=" + inq_groupno + ", inq_orderno="
				+ inq_orderno + "]";
	}

	public Inquiry(int inq_no, String mem_id, String inq_content, String inq_regdate, String inq_reply, int inq_groupno,
			int inq_orderno) {
		super();
		this.inq_no = inq_no;
		this.mem_id = mem_id;
		this.inq_content = inq_content;
		this.inq_regdate = inq_regdate;
		this.inq_reply = inq_reply;
		this.inq_groupno = inq_groupno;
		this.inq_orderno = inq_orderno;
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

	public String getInq_reply() {
		return inq_reply;
	}

	public void setInq_reply(String inq_reply) {
		this.inq_reply = inq_reply;
	}

	public int getInq_groupno() {
		return inq_groupno;
	}

	public void setInq_groupno(int inq_groupno) {
		this.inq_groupno = inq_groupno;
	}

	public int getInq_orderno() {
		return inq_orderno;
	}

	public void setInq_orderno(int inq_orderno) {
		this.inq_orderno = inq_orderno;
	}

	

}