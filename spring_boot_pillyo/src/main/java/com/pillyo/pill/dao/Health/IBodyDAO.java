package com.pillyo.pill.dao.Health;

import java.util.ArrayList;

import com.pillyo.pill.model.Health.BodyVO;

public interface IBodyDAO {
	ArrayList<BodyVO>listAllBody();
	void insertBody(BodyVO vo);
	void updateBody(BodyVO vo);
	void deleteBody(int bodyNo);
	BodyVO detailViewBody(int BodyNo);
}
