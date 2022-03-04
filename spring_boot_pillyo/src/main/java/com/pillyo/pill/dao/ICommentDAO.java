package com.pillyo.pill.dao;

import java.util.ArrayList;

import com.pillyo.pill.model.CommentVO;

public interface ICommentDAO {
	ArrayList<CommentVO>listAllComment();

	void insertcomment(CommentVO commentvo);
}
