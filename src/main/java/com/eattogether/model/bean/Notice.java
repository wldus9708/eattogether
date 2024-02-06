package com.eattogether.model.bean;


public class Notice {
	private int not_no;
	private int mem_no;
	private String not_header;
	private String not_content;
	private String not_regdate;
	
	@Override
	public String toString() {
		return "Notice [not_no=" + not_no + ", mem_no=" + mem_no + ", not_header=" + not_header + ", not_content="
				+ not_content + ", not_regdate=" + not_regdate + "]";
	}
	
	
	
	public Notice(int not_no, int mem_no, String not_header, String not_content, String not_regdate) {
		super();
		this.not_no = not_no;
		this.mem_no = mem_no;
		this.not_header = not_header;
		this.not_content = not_content;
		this.not_regdate = not_regdate;
	}
	
	

	public int getNot_no() {
		return not_no;
	}



	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}



	public int getMem_no() {
		return mem_no;
	}



	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}



	public String getNot_header() {
		return not_header;
	}



	public void setNot_header(String not_header) {
		this.not_header = not_header;
	}



	public String getNot_content() {
		return not_content;
	}



	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}



	public String getNot_regdate() {
		return not_regdate;
	}



	public void setNot_regdate(String not_regdate) {
		this.not_regdate = not_regdate;
	}



	public Notice() {}
	

}
