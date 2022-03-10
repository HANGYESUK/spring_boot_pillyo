package com.pillyo.pill.model.notification;

public class notificationVO {
	private int doseNotiNo; // 복용 알림 번호
	private String userId; // 사용자 아이디
	private int afterGetup;
	private int morning;
	private int lunch;
	private int dinner;
	private int beforeBed;
	
	public int getDoseNotiNo() {
		return doseNotiNo;
	}
	public void setDoseNotiNo(int doseNotiNo) {
		this.doseNotiNo = doseNotiNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAfterGetup() {
		return afterGetup;
	}
	public void setAfterGetup(int afterGetup) {
		this.afterGetup = afterGetup;
	}
	public int getMorning() {
		return morning;
	}
	public void setMorning(int morning) {
		this.morning = morning;
	}
	public int getLunch() {
		return lunch;
	}
	public void setLunch(int lunch) {
		this.lunch = lunch;
	}
	public int getDinner() {
		return dinner;
	}
	public void setDinner(int dinner) {
		this.dinner = dinner;
	}
	public int getBeforeBed() {
		return beforeBed;
	}
	public void setBeforeBed(int beforeBed) {
		this.beforeBed = beforeBed;
	}
	
}
