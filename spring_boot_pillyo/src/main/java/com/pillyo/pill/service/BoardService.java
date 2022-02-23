package com.pillyo.pill.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public ArrayList<BoardVO> listAllBoard() {
		// TODO Auto-generated method stub
		return dao.listAllBoard();
	}

	@Override
	public void insertboard(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.insertboard(vo);
	}
	
	@Override
	public BoardVO boardDetailView(int boardNo) {
		return dao.boardDetailView(boardNo);
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
	}
	
	@Override
	public void deleteBoard(int boardNo) {
		dao.deleteBoard(boardNo);
	}

	public ArrayList<BoardVO> listAllBoardQna() {
		// TODO Auto-generated method stub
		return dao.listAllBoardQna();
	}

	public ArrayList<BoardVO> listAllBoardQna2() {
		// TODO Auto-generated method stub
		return dao.listAllBoardQna2(); 
	}

	public ArrayList<BoardVO> listAllBoardQna3() {
		// TODO Auto-generated method stub
		return dao.listAllBoardQna3();
	}
	
	public ArrayList<BoardVO> listAllBoardQna4() {
		// TODO Auto-generated method stub
		return dao.listAllBoardQna4();
	}
	
	public ArrayList<BoardVO> listAllBoardQna5() {
		// TODO Auto-generated method stub
		return dao.listAllBoardQna5();
	}
	
//	@Override
//	public static int boardListCnt() {
//		// TODO Auto-generated method stub
//		dao.boardListCnt();
//	}

	

//	public ArrayList<BoardVO> listAllBoard(HashMap<String, Object> map) {
//		// TODO Auto-generated method stub
//		return dao.listAllBoard(map);
//	}


}
