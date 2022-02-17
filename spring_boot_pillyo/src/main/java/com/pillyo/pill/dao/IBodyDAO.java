package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.BodyVO;

public interface IBodyDAO {
	ArrayList<BodyVO>listAllBody();
	void insertBody(BodyVO vo);
	void updateBody(BodyVO vo);
	void deleteBody(int bodyNo);
	BodyVO detailViewBody(int BodyNo);
}
