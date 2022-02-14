package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.PressureVO;
import com.pillyo.pill.model.SugarVO;

public interface IPressureDAO {
	ArrayList<PressureVO>listAllPressure();
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(int pressureNo);
	PressureVO detailViewPressure(int pessureNo);
}
