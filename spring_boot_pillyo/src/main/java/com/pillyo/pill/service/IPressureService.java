package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.PressureVO;

public interface IPressureService {
	ArrayList<PressureVO>listAllPressure();
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(int pressureNo);
	PressureVO detailViewPressure(int famNo);
	ArrayList<PressureVO>listAllPressure(int famNo);
}
