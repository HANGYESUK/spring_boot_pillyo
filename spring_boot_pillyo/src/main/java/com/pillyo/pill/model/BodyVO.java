package com.pillyo.pill.model;

public class BodyVO {
	private int BodyNo;
	private String height;
	private String weight;
	private int bmi;
	private String bodyRecordDate;
	private int famNo;
	
	//테이블엔 없지만 사용할 정보
	private String famMember;
	private String userId;
	
	public int getBodyNo() {
		return BodyNo;
	
	}
	public void setBodyNo(int bodyNo) {
		BodyNo = bodyNo;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public int getBmi() {
		return bmi;
	}
	public void setBmi(int bmi) {
		this.bmi = bmi;
	}
	public String getBodyRecordDate() {
		return bodyRecordDate;
	}
	public void setBodyRecordDate(String bodyRecordDate) {
		this.bodyRecordDate = bodyRecordDate;
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
