package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.IFeelDAO;
import com.pillyo.pill.model.FeelVO;

@Service
public class FeelService implements IFeelService{
	@Autowired
	@Qualifier("IFeelDAO")
	IFeelDAO dao;

	@Override
	public ArrayList<FeelVO> listAllFeelVO() {
		return dao.listAllFeelVO();
	}

	@Override
	public void insertFeel(FeelVO feelVo) {
		dao.insertFeel(feelVo);
	}

	@Override
	public void updateFeel(FeelVO feelVo) {
		dao.updateFeel(feelVo);
	}

	@Override
	public void deleteFeel(int feelNo) {
		dao.deleteFeel(feelNo);
	}

	@Override
	public FeelVO detailViewFeel(int feelNo) {
		return dao.detailViewFeel(feelNo);
	}
}