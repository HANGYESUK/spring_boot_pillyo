package com.pillyo.pill.model;

public class FeelVO {
	
	// 기분관리 : 관리번호, 기분척도, 메모, 기록날짜, 기록시간, 가족번호
	private int feelNo;
	private int feelScale;
	private String feelMemo;
	private String feelRecordDate;
	private String feelRecordTime;
	private int famNo;
	
	//테이블엔 없지만 사용할 정보
	private String famMember;
	private String userId;
	
	
	public int getFeelNo() {
		return feelNo;
	}
	public void setFeelNo(int feelNo) {
		this.feelNo = feelNo;
	}
	public int getFeelScale() {
		return feelScale;
	}
	public void setFeelScale(int feelScale) {
		this.feelScale = feelScale;
	}
	public String getFeelMemo() {
		return feelMemo;
	}
	public void setFeelMemo(String feelMemo) {
		this.feelMemo = feelMemo;
	}
	public String getFeelRecordDate() {
		return feelRecordDate;
	}
	public void setFeelRecordDate(String feelRecordDate) {
		this.feelRecordDate = feelRecordDate;
	}
	public String getFeelRecordTime() {
		return feelRecordTime;
	}
	public void setFeelRecordTime(String feelRecordTime) {
		this.feelRecordTime = feelRecordTime;
	}
	public int getFamNo() {
		return famNo;
	}
	public void setFamNo(int famNo) {
		this.famNo = famNo;
	}
	public String getFamMember() {
		return famMember;
	}
	public void setFamMember(String famMember) {
		this.famMember = famMember;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	
}