package com.pillyo.pill.model;

public class DoseVO {
	private int ddNo;
	private int famNo;
	private String ddTitle;
	private int drugInfoNo;
	private String ddStartDate;
	private String ddEndDate;
	private int ddCycle;
	private String ddTimeSlot;
	private String ddTime;
	private int ddAmount;
	private String doseDrugName; // 복용 상세 정보 : 약 이름
	private String doseFamName; // 복용 상세 정보 : 약 이름

	public DoseVO() { }

	public int getDdNo() {
		return ddNo;
	}

	public void setDdNo(int ddNo) {
		this.ddNo = ddNo;
	}

	public int getFamNo() {
		return famNo;
	}

	public void setFamNo(int famNo) {
		this.famNo = famNo;
	}

	public String getDdTitle() {
		return ddTitle;
	}

	public void setDdTitle(String ddTitle) {
		this.ddTitle = ddTitle;
	}

	public int getDrugInfoNo() {
		return drugInfoNo;
	}

	public void setDrugInfoNo(int drugInfoNo) {
		this.drugInfoNo = drugInfoNo;
	}

	public String getDdStartDate() {
		return ddStartDate;
	}

	public void setDdStartDate(String ddStartDate) {
		this.ddStartDate = ddStartDate;
	}

	public String getDdEndDate() {
		return ddEndDate;
	}

	public void setDdEndDate(String ddEndDate) {
		this.ddEndDate = ddEndDate;
	}

	public int getDdCycle() {
		return ddCycle;
	}

	public void setDdCycle(int ddCycle) {
		this.ddCycle = ddCycle;
	}

	public String getDdTimeSlot() {
		return ddTimeSlot;
	}

	public void setDdTimeSlot(String ddTimeSlot) {
		this.ddTimeSlot = ddTimeSlot;
	}
	
	public String getDdTime() {
		return ddTime;
	}

	public void setDdTime(String ddTime) {
		this.ddTime = ddTime;
	}

	public int getDdAmount() {
		return ddAmount;
	}

	public void setDdAmount(int ddAmount) {
		this.ddAmount = ddAmount;
	}
	
	public String getDoseDrugName() {
		return doseDrugName;
	}

	public void setDoseDrugName(String doseDrugName) {
		this.doseDrugName = doseDrugName;
	}

	public String getDoseFamName() {
		return doseFamName;
	}

	public void setDoseFamName(String doseFamName) {
		this.doseFamName = doseFamName;
	}
	
}
