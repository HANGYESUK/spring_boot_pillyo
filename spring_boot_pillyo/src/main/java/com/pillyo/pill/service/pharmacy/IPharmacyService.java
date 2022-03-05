package com.pillyo.pill.service.pharmacy;

import java.util.ArrayList;

import com.pillyo.pill.model.pharmacy.PharmacyVO;

public interface IPharmacyService {
	// void insertPharmList(ArrayList<PharmacyVO> pharmList);		// 약국 정보 DB에 등록
	ArrayList<PharmacyVO> listAllPharm(); // 약국 전체 목록 조회
	// PharmacyVO detailViewPharm(String pharmNo);	// 약국 상세정보 조회
}
