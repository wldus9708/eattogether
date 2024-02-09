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
	private String rec_content02;
	private String rec_content03;
	private String rec_content04;
	private String rec_content05;
	private String rec_content06;
	private String rec_content07;
	private String rec_content08;
	private String rec_content09;
	private String rec_content10;
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
	public String getRec_content02() {
		return rec_content02;
	}
	public void setRec_content02(String rec_content02) {
		this.rec_content02 = rec_content02;
	}
	public String getRec_content03() {
		return rec_content03;
	}
	public void setRec_content03(String rec_content03) {
		this.rec_content03 = rec_content03;
	}
	public String getRec_content04() {
		return rec_content04;
	}
	public void setRec_content04(String rec_content04) {
		this.rec_content04 = rec_content04;
	}
	public String getRec_content05() {
		return rec_content05;
	}
	public void setRec_content05(String rec_content05) {
		this.rec_content05 = rec_content05;
	}
	public String getRec_content06() {
		return rec_content06;
	}
	public void setRec_content06(String rec_content06) {
		this.rec_content06 = rec_content06;
	}
	public String getRec_content07() {
		return rec_content07;
	}
	public void setRec_content07(String rec_content07) {
		this.rec_content07 = rec_content07;
	}
	public String getRec_content08() {
		return rec_content08;
	}
	public void setRec_content08(String rec_content08) {
		this.rec_content08 = rec_content08;
	}
	public String getRec_content09() {
		return rec_content09;
	}
	public void setRec_content09(String rec_content09) {
		this.rec_content09 = rec_content09;
	}
	public String getRec_content10() {
		return rec_content10;
	}
	public void setRec_content10(String rec_content10) {
		this.rec_content10 = rec_content10;
	}
	
	@Override
	public String toString() {
		return "Recipe [rec_no=" + rec_no + ", mem_no=" + mem_no + ", cat_no=" + cat_no + ", rec_header=" + rec_header
				+ ", rec_content=" + rec_content + ", rec_regdate=" + rec_regdate + ", rec_photo=" + rec_photo
				+ ", rec_hit=" + rec_hit + ", rec_popularity=" + rec_popularity + ", rec_bookmark=" + rec_bookmark
				+ ", rec_material=" + rec_material + ", rec_content02=" + rec_content02 + ", rec_content03="
				+ rec_content03 + ", rec_content04=" + rec_content04 + ", rec_content05=" + rec_content05
				+ ", rec_content06=" + rec_content06 + ", rec_content07=" + rec_content07 + ", rec_content08="
				+ rec_content08 + ", rec_content09=" + rec_content09 + ", rec_content10=" + rec_content10 + "]";
	}
	
	public Recipe(Integer rec_no, Integer mem_no, Integer cat_no, String rec_header, String rec_content,
			String rec_regdate, String rec_photo, Integer rec_hit, Integer rec_popularity, String rec_bookmark,
			String rec_material, String rec_content02, String rec_content03, String rec_content04, String rec_content05,
			String rec_content06, String rec_content07, String rec_content08, String rec_content09,
			String rec_content10) {
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
		this.rec_content02 = rec_content02;
		this.rec_content03 = rec_content03;
		this.rec_content04 = rec_content04;
		this.rec_content05 = rec_content05;
		this.rec_content06 = rec_content06;
		this.rec_content07 = rec_content07;
		this.rec_content08 = rec_content08;
		this.rec_content09 = rec_content09;
		this.rec_content10 = rec_content10;
	}
	
	public Recipe() {
		super();
	}

	

}