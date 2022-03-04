package com.pillyo.pill.model;

public class CommentVO {
	private int commentNo;
	private String userId;
	private String commentTitle;
	private String commentContent;
	private String commentWriteDate;
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentWriteDate() {
		return commentWriteDate;
	}
	public void setCommentWriteDate(String commentWriteDate) {
		this.commentWriteDate = commentWriteDate;
	}
	
}
