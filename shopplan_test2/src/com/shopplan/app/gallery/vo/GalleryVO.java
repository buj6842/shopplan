package com.shopplan.app.gallery.vo;

public class GalleryVO {
	private int gal_num;
	private String gal_id;
	private String gal_buildingtype;
	private String gal_roomtype;
	private String gal_colortype;
	private int gal_like;
	private String gal_date;
	private String gal_filepath;
	
	public String getGal_filepath() {
		return gal_filepath;
	}

	public void setGal_filepath(String gal_filepath) {
		this.gal_filepath = gal_filepath;
	}

	public String getGal_roomtype() {
		return gal_roomtype;
	}

	public void setGal_roomtype(String gal_roomtype) {
		this.gal_roomtype = gal_roomtype;
	}
	public GalleryVO() {;}

		
	public int getGal_num() {
		return gal_num;
	}
	public void setGal_num(int gal_num) {
		this.gal_num = gal_num;
	}

	public String getGal_id() {
		return gal_id;
	}
	public void setGal_id(String gal_id) {
		this.gal_id = gal_id;
	}
	public String getGal_buildingtype() {
		return gal_buildingtype;
	}
	public void setGal_buildingtype(String gal_buildingtype) {
		this.gal_buildingtype = gal_buildingtype;
	}
	public String getGal_colortype() {
		return gal_colortype;
	}
	public void setGal_colortype(String gal_colortype) {
		this.gal_colortype = gal_colortype;
	}
	public int getGal_like() {
		return gal_like;
	}
	public void setGal_like(int gal_like) {
		this.gal_like = gal_like;
	}
	public String getGal_date() {
		return gal_date;
	}
	public void setGal_date(String gal_date) {
		this.gal_date = gal_date;
	}
}
