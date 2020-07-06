package com.bitcamp.project.service;

import java.util.Map;

import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;

public interface CommentService {
	public int writeComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo, BoardVO bVo);
    public Map<String, Object> commentList(CommentVO vo, int nowPage);
    public int count(CommentVO vo);
    public int commentNoticeInsert(BoardVO vo);
}
