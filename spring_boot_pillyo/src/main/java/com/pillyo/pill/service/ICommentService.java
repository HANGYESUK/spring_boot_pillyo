package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.CommentVO;

public interface ICommentService {
	ArrayList<CommentVO>listAllComment(int boardNo);
	void insertcomment(CommentVO commentvo);
	void deleteComment(int commentNo);
}
