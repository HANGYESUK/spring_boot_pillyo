package com.pillyo.pill.model;

public class BodyVO {
	private int BodyNo;
	private String height;
	private String weight;
	private int bmi;
	private String bodyRecordDate;
	private int famNo;
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

}
