package com.shopplan.app.askhelp.vo;



public class AskhelpReplyVO {
	private int helpreply_num;
	private int helpboard_num;
	private String user_id;
	private String reply_content;
	
	public AskhelpReplyVO() {;}

	public int getHelpreply_num() {
		return helpreply_num;
	}

	public void setHelpreply_num(int helpreply_num) {
		this.helpreply_num = helpreply_num;
	}

	public int getHelpboard_num() {
		return helpboard_num;
	}

	public void setHelpboard_num(int helpboard_num) {
		this.helpboard_num = helpboard_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
}
