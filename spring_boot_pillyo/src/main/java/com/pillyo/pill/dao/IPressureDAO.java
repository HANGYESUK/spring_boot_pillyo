package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.PressureVO;

public interface IPressureDAO {
	ArrayList<PressureVO>listAllPressure();
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(String pressureNo);
}
