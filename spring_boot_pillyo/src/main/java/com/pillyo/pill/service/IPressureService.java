package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.pillyo.pill.model.PressureVO;

public interface IPressureService {
	ArrayList<PressureVO>listAllPressure();
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(String pressureNo);
}
