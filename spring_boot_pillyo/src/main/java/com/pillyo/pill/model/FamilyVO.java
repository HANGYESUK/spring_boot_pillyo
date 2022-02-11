package com.pillyo.pill.model;

public class FamilyVO {
	private String famNo; // 가족번호
	private String userId; // 아이디
	private String famMemName; // 이름
	private String famRelation; // 관계
	private String famBirth; // 생년월일
	private int famGender; // 성별
	
	public FamilyVO() { }

	public String getFamNo() {
		return famNo;
	}

	public void setFamNo(String famNo) {
		this.famNo = famNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFamMemName() {
		return famMemName;
	}

	public void setFamMemName(String famMemName) {
		this.famMemName = famMemName;
	}

	public String getFamRelation() {
		return famRelation;
	}

	public void setFamRelation(String famRelation) {
		this.famRelation = famRelation;
	}

	public String getFamBirth() {
		return famBirth;
	}

	public void setFamBirth(String famBirth) {
		this.famBirth = famBirth;
	}

	public int getFamGender() {
		return famGender;
	}

	public void setFamGender(int famGender) {
		this.famGender = famGender;
	}
}
