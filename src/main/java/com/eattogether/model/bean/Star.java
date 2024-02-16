package com.eattogether.model.bean;

public class Star {
	private Integer rec_no;
	private String mem_id;
    private String rec_photo;
	public Star() {}
	public Star(Integer rec_no, String mem_id, String rec_photo) {
		super();
		this.rec_no = rec_no;
		this.mem_id = mem_id;
		this.rec_photo = rec_photo;
	}
	@Override
	public String toString() {
		return "Star [rec_no=" + rec_no + ", mem_id=" + mem_id + ", rec_photo=" + rec_photo + "]";
	}
	public Integer getRec_no() {
		return rec_no;
	}
	public void setRec_no(Integer rec_no) {
		this.rec_no = rec_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRec_photo() {
		return rec_photo;
	}
	public void setRec_photo(String rec_photo) {
		this.rec_photo = rec_photo;
	}
}
