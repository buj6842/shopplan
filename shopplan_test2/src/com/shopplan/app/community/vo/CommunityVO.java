package com.shopplan.app.community.vo;

public class CommunityVO {
	private int community_num;
	private String community_title;
	private String community_id;
	private String community_content;
	private int readcount;
	private String community_date;
	
	public CommunityVO() {;}
	
	public int getCommunity_num() {
		return community_num;
	}
	public void setCommunity_num(int community_num) {
		this.community_num = community_num;
	}
	public String getCommunity_title() {
		return community_title;
	}
	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}
	public String getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(String community_id) {
		this.community_id = community_id;
	}
	public String getCommunity_content() {
		return community_content;
	}
	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getCommunity_date() {
		return community_date;
	}
	public void setCommunity_date(String community_date) {
		this.community_date = community_date;
	}

}
