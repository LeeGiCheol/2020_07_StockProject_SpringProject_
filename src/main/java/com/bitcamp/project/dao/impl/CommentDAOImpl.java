package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.CommentDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;

@Repository("CommentDAO")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int writeComment(CommentVO vo) {
		System.out.println("mybatis insert + " +vo);
		return mybatis.insert("comment.writeComment", vo);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return mybatis.update("comment.updateComment", vo);
	}

	@Override
	public int deleteComment(CommentVO vo) {
		return mybatis.delete("comment.deleteComment", vo);
	}

	@Override
    public List<CommentVO> getCommentList(PagingVO vo){
		return mybatis.selectList("comment.commentList", vo);
	}

	public int count(CommentVO vo) {
		return mybatis.selectOne("comment.commentCount", vo);
	}
	 
	public int commentNoticeInsert(BoardVO vo) {
		return mybatis.insert("comment.commentNoticeInsert", vo);
	}
	 

}
