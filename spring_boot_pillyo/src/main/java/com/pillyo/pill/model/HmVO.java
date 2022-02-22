package com.pillyo.pill.model;

public class HmVO{
	private int hmNo;			// 우리집 상비약 등록 번호 (기본키)
	private String userId;		// 회원아이디 (외래키)
	private int hmCtgNo;		// 상비약 카테고리 번호 (외래키)
	private String hmName;		// 상비약 이름
	private String hmUseByDate;	// 상비약 사용 기한
	private String hmMemo;		// 메모
	private String hmImg;		// 상비약 이미지	
	private String hmCtgName;
	
	public int getHmNo() {
		return hmNo;
	}


	public void setHmNo(int hmNo) {
		this.hmNo = hmNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getHmCtgNo() {
		return hmCtgNo;
	}


	public void setHmCtgNo(int hmCtgNo) {
		this.hmCtgNo = hmCtgNo;
	}


	public String getHmName() {
		return hmName;
	}


	public void setHmName(String hmName) {
		this.hmName = hmName;
	}


	public String getHmUseByDate() {
		return hmUseByDate;
	}


	public void setHmUseByDate(String hmUseByDate) {
		this.hmUseByDate = hmUseByDate;
	}


	public String getHmMemo() {
		return hmMemo;
	}


	public void setHmMemo(String hmMemo) {
		this.hmMemo = hmMemo;
	}


	public String getHmImg() {
		return hmImg;
	}


	public void setHmImg(String hmImg) {
		this.hmImg = hmImg;
	}


	public String getHmCtgName() {
		return hmCtgName;
	}


	public void setHmCtgName(String hmCtgName) {
		this.hmCtgName = hmCtgName;
	}
	
	
}