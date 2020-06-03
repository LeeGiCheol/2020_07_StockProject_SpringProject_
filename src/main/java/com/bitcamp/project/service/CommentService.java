package com.bitcamp.project.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;

public interface CommentService {
	public int writeComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
    public Map<String, Object> commentList(CommentVO vo, int nowPage);
    public int count(CommentVO vo);
    
}
