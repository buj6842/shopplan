package com.shopplan.app.askboard.vo;

public class AskBoardVO {
	private int askboard_num;
	private String askboard_title;
	private String askboard_content;
	private String askboard_id;
	private String askboard_date;
	private int readCount;
	
	public AskBoardVO() {;}
	

	public int getAskboard_num() {
		return askboard_num;
	}

	public void setAskboard_num(int askboard_num) {
		this.askboard_num = askboard_num;
	}

	public String getAskboard_title() {
		return askboard_title;
	}

	public void setAskboard_title(String askboard_title) {
		this.askboard_title = askboard_title;
	}

	public String getAskboard_content() {
		return askboard_content;
	}

	public void setAskboard_content(String askboard_content) {
		this.askboard_content = askboard_content;
	}

	public String getAskboard_id() {
		return askboard_id;
	}

	public void setAskboard_id(String askboard_id) {
		this.askboard_id = askboard_id;
	}

	public String getAskboard_date() {
		return askboard_date;
	}

	public void setAskboard_date(String askboard_date) {
		this.askboard_date = askboard_date;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
}