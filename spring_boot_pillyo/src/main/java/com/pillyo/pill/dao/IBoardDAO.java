package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.BoardVO;

public interface IBoardDAO {
	ArrayList<BoardVO>listAllBoard();
	void insertboard(BoardVO vo);
	BoardVO boardDetailView(int id);
	void updateBoard(BoardVO vo);
	void deleteBoard(int id);
	
	

}
