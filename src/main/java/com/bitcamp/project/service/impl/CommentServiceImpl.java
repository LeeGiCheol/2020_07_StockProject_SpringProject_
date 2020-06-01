package com.bitcamp.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.CommentDAO;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.CommentVO;

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
	public void deleteComment(CommentVO vo) {
		commentDAO.deleteComment(vo);
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO vo) {
		return null;
	}

	
	
	

}
