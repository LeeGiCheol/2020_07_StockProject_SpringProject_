package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.CommentDAO;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public int writeComment(CommentVO vo) {
		return commentDAO.writeComment(vo);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return commentDAO.updateComment(vo);
	}

	@Override
	public int deleteComment(CommentVO vo) {
		return commentDAO.deleteComment(vo);
	}

	@Override
    public List<CommentVO> getCommentList(PagingVO vo){
		return commentDAO.getCommentList(vo);
	}

	public int count(CommentVO vo) {
		return commentDAO.count(vo);
	}
	


	

	
	
	

}
