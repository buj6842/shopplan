package com.shopplan.app.community.vo;

public class CommunityReplyVO {
	private int community_reply_num;
	private int community_num;
	private String user_id;
	private String community_reply_content;
	
	public String getCommunity_reply_content() {
		return community_reply_content;
	}

	public void setCommunity_reply_content(String community_reply_content) {
		this.community_reply_content = community_reply_content;
	}

	public CommunityReplyVO() {;}
	
	public int getCommunity_reply_num() {
		return community_reply_num;
	}
	public void setCommunity_reply_num(int community_reply_num) {
		this.community_reply_num = community_reply_num;
	}
	public int getCommunity_num() {
		return community_num;
	}
	public void setCommunity_num(int community_num) {
		this.community_num = community_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
