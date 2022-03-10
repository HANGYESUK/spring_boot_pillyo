package com.pillyo.pill.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.pillyo.pill.dao.ICommentDAO;
import com.pillyo.pill.model.CommentVO;

@Service
public class CommentService implements ICommentService {
	@Autowired
	@Qualifier("ICommentDAO")
	ICommentDAO dao;
	
	public ArrayList<CommentVO> listAllComment(int boardNo){
		return dao.listAllComment(boardNo);
	}

	public void insertcomment(CommentVO commentvo) {
		// TODO Auto-generated method stub
		dao.insertcomment(commentvo);
	}

	@Override
	public void deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		dao.deleteComment(commentNo);
		
	}

	
}
