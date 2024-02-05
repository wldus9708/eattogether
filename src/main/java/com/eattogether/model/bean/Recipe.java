package com.eattogether.model.bean;

import com.eattogether.common.Superclass;

public class Recipe extends Superclass {
	private Integer rec_no;
	private Integer mem_no;
	private Integer cat_no;
	private String rec_header;
	private String rec_content;
	private String rec_regdate; // 등록일 날짜 형식
	private String rec_photo;; // 사진
	private Integer rec_hit;
	private Integer rec_popularity;
	private String rec_bookmark; // 즐겨찾기 플래그
	private String rec_material;

	public Recipe() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getRec_no() {
		return rec_no;
	}

	public void setRec_no(Integer rec_no) {
		this.rec_no = rec_no;
	}

	public Integer getMem_no() {
		return mem_no;
	}

	public void setMem_no(Integer mem_no) {
		this.mem_no = mem_no;
	}

	public Integer getCat_no() {
		return cat_no;
	}

	public void setCat_no(Integer cat_no) {
		this.cat_no = cat_no;
	}

	public String getRec_header() {
		return rec_header;
	}

	public void setRec_header(String rec_header) {
		this.rec_header = rec_header;
	}

	public String getRec_content() {
		return rec_content;
	}

	public void setRec_content(String rec_content) {
		this.rec_content = rec_content;
	}

	public String getRec_regdate() {
		return rec_regdate;
	}

	public void setRec_regdate(String rec_regdate) {
		this.rec_regdate = rec_regdate;
	}

	public String getRec_photo() {
		return rec_photo;
	}

	public void setRec_photo(String rec_photo) {
		this.rec_photo = rec_photo;
	}

	public Integer getRec_hit() {
		return rec_hit;
	}

	public void setRec_hit(Integer rec_hit) {
		this.rec_hit = rec_hit;
	}

	public Integer getRec_popularity() {
		return rec_popularity;
	}

	public void setRec_popularity(Integer rec_popularity) {
		this.rec_popularity = rec_popularity;
	}

	public String getRec_bookmark() {
		return rec_bookmark;
	}

	public void setRec_bookmark(String rec_bookmark) {
		this.rec_bookmark = rec_bookmark;
	}

	public String getRec_material() {
		return rec_material;
	}

	public void setRec_material(String rec_material) {
		this.rec_material = rec_material;
	}

	public Recipe(Integer rec_no, Integer mem_no, Integer cat_no, String rec_header, String rec_content,
			String rec_regdate, String rec_photo, Integer rec_hit, Integer rec_popularity, String rec_bookmark,
			String rec_material) {
		super();
		this.rec_no = rec_no;
		this.mem_no = mem_no;
		this.cat_no = cat_no;
		this.rec_header = rec_header;
		this.rec_content = rec_content;
		this.rec_regdate = rec_regdate;
		this.rec_photo = rec_photo;
		this.rec_hit = rec_hit;
		this.rec_popularity = rec_popularity;
		this.rec_bookmark = rec_bookmark;
		this.rec_material = rec_material;
	}

	@Override
	public String toString() {
		return "Recipe [rec_no=" + rec_no + ", mem_no=" + mem_no + ", cat_no=" + cat_no + ", rec_header=" + rec_header
				+ ", rec_content=" + rec_content + ", rec_regdate=" + rec_regdate + ", rec_photo=" + rec_photo
				+ ", rec_hit=" + rec_hit + ", rec_popularity=" + rec_popularity + ", rec_bookmark=" + rec_bookmark
				+ ", rec_material=" + rec_material + "]";
	}
}