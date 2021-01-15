package com.shopplan.app.askboard.vo;

public class AskBoardReplyVO {
	private int askreply_num;
	private int askboard_num;
	private String user_id;
	private String askreply_content;
	
	public AskBoardReplyVO() {;}

	public int getAskreply_num() {
		return askreply_num;
	}

	public void setAskreply_num(int askreply_num) {
		this.askreply_num = askreply_num;
	}

	public int getAskboard_num() {
		return askboard_num;
	}

	public void setAskboard_num(int askboard_num) {
		this.askboard_num = askboard_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAskreply_content() {
		return askreply_content;
	}

	public void setAskreply_content(String askreply_content) {
		this.askreply_content = askreply_content;
	}

	
}
