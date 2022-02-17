package com.pillyo.pill.service.Health;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.pillyo.pill.model.Health.PressureVO;
import com.pillyo.pill.model.Health.SugarVO;

public interface IPressureService {
	ArrayList<PressureVO>listAllPressure();
	void insertPressure(PressureVO vo);
	void updatePressure(PressureVO vo);
	void deletePressure(int pressureNo);
	PressureVO detailViewPressure(int pressureNo);
}
