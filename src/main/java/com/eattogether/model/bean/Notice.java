package com.eattogether.model.bean;

public class Notice {
	private int not_no;
	private int mem_no;
	private int not_header;
	private int not_content;
	private int not_redate;
	
	@Override
	public String toString() {
		return "Notice [not_no=" + not_no + ", mem_no=" + mem_no + ", not_header=" + not_header + ", not_content="
				+ not_content + ", not_redate=" + not_redate + "]";
	}
	
	
	
	public Notice(int not_no, int mem_no, int not_header, int not_content, int not_redate) {
		super();
		this.not_no = not_no;
		this.mem_no = mem_no;
		this.not_header = not_header;
		this.not_content = not_content;
		this.not_redate = not_redate;
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



	public int getNot_header() {
		return not_header;
	}



	public void setNot_header(int not_header) {
		this.not_header = not_header;
	}



	public int getNot_content() {
		return not_content;
	}



	public void setNot_content(int not_content) {
		this.not_content = not_content;
	}



	public int getNot_redate() {
		return not_redate;
	}



	public void setNot_redate(int not_redate) {
		this.not_redate = not_redate;
	}



	public Notice() {}
	

}
