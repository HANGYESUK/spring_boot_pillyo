package com.pillyo.pill.model;

public class UserVO {

	// 로그인
	private String userId;
	private String userPw;
	
	public UserVO() { }

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPw;
	}

	public void setUserPwd(String userPw) {
		this.userPw = userPw;
	}

}
