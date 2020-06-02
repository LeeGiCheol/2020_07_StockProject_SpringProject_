package com.bitcamp.project.service;

import java.util.List;

import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;

public interface CommentService {
	public int writeComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
    public List<CommentVO> getCommentList(PagingVO vo);
    public int count(CommentVO vo);
}
