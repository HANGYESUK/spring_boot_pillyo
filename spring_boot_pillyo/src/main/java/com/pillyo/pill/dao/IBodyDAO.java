package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.BodyVO;

public interface IBodyDAO {
	void insertBody(BodyVO vo);
	void updateBody(BodyVO vo);
	void deleteBody(int bodyNo);
	BodyVO detailViewBody(int bodyNo);
	ArrayList<BodyVO>listAllBody(int famNo);
	
	//마이페이지
	ArrayList<BodyVO>myListAllBody(String userId);
}
