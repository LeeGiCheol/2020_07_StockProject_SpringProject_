package com.bitcamp.project.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;

public interface CommentDAO {
	public int writeComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
    public List<CommentVO> getCommentList(PagingVO vo);
    public int count(CommentVO vo);
}
