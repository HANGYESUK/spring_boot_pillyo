package com.pillyo.pill.model;

public class HmVO{
	private int hmNo;			// 우리집 상비약 등록 번호 (기본키)
	private String userId;		// 회원아이디 (외래키)
	private int hmCtgNo;		// 상비약 카테고리 번호 (외래키)
	private String hmName;		// 상비약 이름
	private String hmUseByDate;	// 상비약 사용 기한
	private String hmMemo;		// 메모
	private String hmImg;		// 상비약 이미지
	
	// [상비약 번호]--------------------------------------------
	public int getHmNo() {
		return hmNo;
	}
	public void setHmNo(int hmNo) {
		this.hmNo = hmNo;
	}
	// [회원 아이디]--------------------------------------------
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	// [상비약 카테고리 번호]--------------------------------------
	public int getHmCtgNo() {
		return hmCtgNo;
	}
	public void setHmCtgNo(int hmCtgNo) {
		this.hmCtgNo = hmCtgNo;
	}
	// [상비약 이름]--------------------------------------------
	public String getHmName() {
		return hmName;
	}
	public void setHmName(String hmName) {
		this.hmName = hmName;
	}
	// [상비약 사용 기한]-----------------------------------------
	public String getHmUseByDate() {
		return hmUseByDate;
	}
	public void setHmUseByDate(String hmUseByDate) {
		this.hmUseByDate = hmUseByDate;
	}
	// [상비약 메모]--------------------------------------------
	public String getHmMemo() {
		return hmMemo;
	}
	public void setHmMemo(String hmMemo) {
		this.hmMemo = hmMemo;
	}
	// [상비약 이미지 명]-----------------------------------------
	public String getHmImg() {
		return hmImg;
	}
	public void setHmImg(String hmImg) {
		this.hmImg = hmImg;
	}
	
}