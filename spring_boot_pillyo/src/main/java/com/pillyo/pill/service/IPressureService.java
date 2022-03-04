package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.PressureVO;

public interface IPressureService {
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(int pressureNo);
	PressureVO detailViewPressure(int pressureNo);
	ArrayList<PressureVO>listAllPressure(int famNo);
	// 마이페이지
	ArrayList<PressureVO>myListAllPressure(String userId);
}
