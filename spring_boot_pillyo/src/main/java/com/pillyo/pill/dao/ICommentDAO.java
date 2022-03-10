package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.CommentVO;

public interface ICommentDAO {
	ArrayList<CommentVO>listAllComment(int boardNo);

	void insertcomment(CommentVO commentvo);

	void deleteComment(int commentNo);


}
