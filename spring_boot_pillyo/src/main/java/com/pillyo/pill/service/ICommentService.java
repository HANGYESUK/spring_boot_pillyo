package com.pillyo.pill.service;

import java.util.ArrayList;

import com.pillyo.pill.model.CommentVO;

public interface ICommentService {
	ArrayList<CommentVO>listAllComment();
	void insertcomment(CommentVO commentvo);
}
