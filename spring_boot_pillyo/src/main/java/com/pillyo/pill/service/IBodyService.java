package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.BodyVO;

public interface IBodyService {
	void insertBody(BodyVO vo);
	void updateBody(BodyVO vo);
	void deleteBody(int bodyNo);
	BodyVO detailViewBody(int bodyNo);
	ArrayList<BodyVO>listAllBody(int famNo);
	
	//마이페이지
	ArrayList<BodyVO>myListAllBody(String userId);
}
