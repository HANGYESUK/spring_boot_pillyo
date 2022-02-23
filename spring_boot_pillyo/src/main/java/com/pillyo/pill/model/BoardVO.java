package com.pillyo.pill.model;

public class BoardVO {
	private int id;
	private String title;
	private String content;
	private String userId;
	private String joinDate;
	private String boardCtg;
	
	public String getBoardCtg() {
		return boardCtg;
	}
	public void setBoardCtg(String boardCtg) {
		this.boardCtg = boardCtg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	

}
