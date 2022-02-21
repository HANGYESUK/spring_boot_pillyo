package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.BoardVO;

public interface IBoardService {
	ArrayList<BoardVO>listAllBoard();
	void insertboard(BoardVO vo);
	BoardVO boardDetailView(int id);
	void updateBoard(BoardVO vo);
//	void deleteBoard(int id);
	void deleteBoard(int id);
}
