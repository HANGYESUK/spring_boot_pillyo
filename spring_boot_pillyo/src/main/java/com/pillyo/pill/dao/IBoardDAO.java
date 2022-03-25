package com.pillyo.pill.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.pillyo.pill.model.BoardVO;
import com.pillyo.pill.model.CommentVO;

public interface IBoardDAO {
	ArrayList<BoardVO>listAllBoard();
	void insertboard(BoardVO vo);
	BoardVO boardDetailView(int boardNo);
	void updateBoard(BoardVO vo);
	void deleteBoard(int boardNo);
//	ArrayList<BoardVO> listAllBoard(HashMap<String, Object> map); // 카테고리 별 공지사항
	ArrayList<BoardVO> listAllBoardQna();
	ArrayList<BoardVO> listAllBoardQna2(); // 2번 조회시
	ArrayList<BoardVO> listAllBoardQna3();
	ArrayList<BoardVO> listAllBoardQna4();
	ArrayList<BoardVO> listAllBoardQna5();
	void insertcomment(CommentVO vo);
	void deleteComment(int commentNo);
	
	//관리자메뉴
	ArrayList<BoardVO> a_listAllBoard();

}
