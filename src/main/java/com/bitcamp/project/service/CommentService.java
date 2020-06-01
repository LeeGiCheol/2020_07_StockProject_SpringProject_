package com.bitcamp.project.service;

import java.util.List;

import com.bitcamp.project.vo.CommentVO;

public interface CommentService {
	public int writeComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
	public List<CommentVO> getCommentList(CommentVO vo);
	
}
