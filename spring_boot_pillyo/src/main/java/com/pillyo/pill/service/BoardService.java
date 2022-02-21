package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.Criteria;
import com.pillyo.pill.dao.IBoardDAO;
import com.pillyo.pill.model.BoardVO;

@Service
public class BoardService implements IBoardService {
	@Autowired
	@Qualifier("IBoardDAO")
	IBoardDAO dao;
	
	public ArrayList<BoardVO> listAllBoard(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.listAllBoard();
	}

	@Override
	public void insertboard(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.insertboard(vo);
	}
	
	@Override
	public BoardVO boardDetailView(int id) {
		return dao.boardDetailView(id);
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
	}
	
	@Override
	public void deleteBoard(int id) {
		dao.deleteBoard(id);
	}
	
//	@Override
//	public static int boardListCnt() {
//		// TODO Auto-generated method stub
//		dao.boardListCnt();
//	}

	@Override
	public ArrayList<BoardVO> listAllBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	public static int boardListCnt(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
}
