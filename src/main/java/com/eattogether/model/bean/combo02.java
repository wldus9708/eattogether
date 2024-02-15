package com.eattogether.model.bean;

public class combo02 {
	public combo02() {
		
	}
	private String id;
    public combo02(String id, Integer rec_no, String rec_photo) {
		super();
		this.id = id;
		this.rec_no = rec_no;
		this.rec_photo = rec_photo;
	}
	@Override
	public String toString() {
		return "combo02 [id=" + id + ", rec_no=" + rec_no + ", rec_photo=" + rec_photo + ", getId()=" + getId()
				+ ", getRec_no()=" + getRec_no() + ", getRec_photo()=" + getRec_photo() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getRec_no() {
		return rec_no;
	}
	public void setRec_no(Integer rec_no) {
		this.rec_no = rec_no;
	}
	public String getRec_photo() {
		return rec_photo;
	}
	public void setRec_photo(String rec_photo) {
		this.rec_photo = rec_photo;
	}
	private Integer rec_no;
    private String rec_photo;
}
