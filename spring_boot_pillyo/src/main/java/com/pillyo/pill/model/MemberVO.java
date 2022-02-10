package com.pillyo.pill.model;

public class MemberVO {

	// 로그인
	private String userId;
	private String userPw;
	
	public MemberVO() { }

	public String getMemId() {
		return userId;
	}

	public void setMemId(String userId) {
		this.userId = userId;
	}

	public String getMemPwd() {
		return userPw;
	}

	public void setMemPwd(String userPw) {
		this.userPw = userPw;
	}

}
