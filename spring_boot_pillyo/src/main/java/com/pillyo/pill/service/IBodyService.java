package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.BodyVO;

public interface IBodyService {
	ArrayList<BodyVO>listAllBody();
	void insertBody(BodyVO vo);
	void updateBody(BodyVO vo);
	void deleteBody(int bodyNo);
	BodyVO detailViewBody(int BodyNo);
}
