package com.pillyo.pill.model;

public class UserVO {

	//user 테이블 필드
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String joinDate;
	private String userHp;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;
	private int joinPath;
	private int notification;
	
	//update때 사용할 변수
	private String userEmailId;
	private String userEmailText;
	private String userHp1;
	private String userHp2;
	private String userHp3;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getUserHp() {
		return userHp;
	}
	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress1() {
		return userAddress1;
	}
	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}
	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}
	public String getUserEmailId() {
		return userEmailId;
	}
	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}
	public String getUserEmailText() {
		return userEmailText;
	}
	public void setUserEmailText(String userEmailText) {
		this.userEmailText = userEmailText;
	}
	public String getUserHp1() {
		return userHp1;
	}
	public void setUserHp1(String userHp1) {
		this.userHp1 = userHp1;
	}
	public String getUserHp2() {
		return userHp2;
	}
	public void setUserHp2(String userHp2) {
		this.userHp2 = userHp2;
	}
	public String getUserHp3() {
		return userHp3;
	}
	public void setUserHp3(String userHp3) {
		this.userHp3 = userHp3;
	}
	public int getJoinPath() {
		return joinPath;
	}
	public void setJoinPath(int joinPath) {
		this.joinPath = joinPath;
	}
	public int getNotification() {
		return notification;
	}
	public void setNotification(int notification) {
		this.notification = notification;
	}
		
}
