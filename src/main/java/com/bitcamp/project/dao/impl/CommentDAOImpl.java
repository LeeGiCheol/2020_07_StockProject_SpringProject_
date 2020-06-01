package com.bitcamp.project.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.CommentDAO;
import com.bitcamp.project.vo.CommentVO;

@Repository("CommentDAO")
public class CommentDAOImpl implements CommentDAO {

	@Override
	public int writeComment(CommentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(CommentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteComment(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
