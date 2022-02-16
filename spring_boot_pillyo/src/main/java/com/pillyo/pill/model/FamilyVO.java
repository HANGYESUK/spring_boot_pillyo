package com.pillyo.pill.model;

public class FamilyVO {
	private int famNo; // 가족번호
	private String userId; // 아이디 
	private String famMember; // 이름
	private String famBirth; // 생년월일
	private int famGender; // 성별
	
	public FamilyVO() { }

	public int getFamNo() {
		return famNo;
	}

	public void setFamNo(int famNo) {
		this.famNo = famNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFamMember() {
		return famMember;
	}

	public void setFamMember(String famMember) {
		this.famMember = famMember;
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
