package com.pillyo.pill.model;

public class PressureVO {
	
	private int pressureNo;
	private String situation;
	private int SBP;
	private int DBP;
	private int bpm;
	private String pressureMemo;
	private String pressureRecordDate;
	private String pressureRecordTime;
	private int famNo;
	
	public int getPressureNo() {
		return pressureNo;
	}
	public void setPressureNo(int pressureNo) {
		this.pressureNo = pressureNo;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public int getSBP() {
		return SBP;
	}
	public void setSBP(int sBP) {
		SBP = sBP;
	}
	public int getDBP() {
		return DBP;
	}
	public void setDBP(int dBP) {
		DBP = dBP;
	}
	public int getBpm() {
		return bpm;
	}
	public void setBpm(int bpm) {
		this.bpm = bpm;
	}
	public String getPressureMemo() {
		return pressureMemo;
	}
	public void setPressureMemo(String pressureMemo) {
		this.pressureMemo = pressureMemo;
	}
	public String getPressureRecordDate() {
		return pressureRecordDate;
	}
	public void setPressureRecordDate(String pressureRecordDate) {
		this.pressureRecordDate = pressureRecordDate;
	}
	public String getPressureRecordTime() {
		return pressureRecordTime;
	}
	public void setPressureRecordTime(String pressureRecordTime) {
		this.pressureRecordTime = pressureRecordTime;
	}
	public int getFamNo() {
		return famNo;
	}
	public void setFamNo(int famNo) {
		this.famNo = famNo;
	}

}
