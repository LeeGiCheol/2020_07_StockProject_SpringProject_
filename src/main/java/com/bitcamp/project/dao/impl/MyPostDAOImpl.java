package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.MyPostDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Repository("MyPostDAO")
public class MyPostDAOImpl implements MyPostDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void myListSearch() {
		// TODO Auto-generated method stub

	}

	@Override
	public void myCommentList() {
		// TODO Auto-generated method stub

	}
	
	public int countBoard(UserVO loginUser) {	
		return mybatis.selectOne("board.myPostCount",loginUser);
	}
	
	@Override
	public List<BoardVO> myBoardList(PagingVO page) {
		return mybatis.selectList("board.getMyBoard", page);
	}
	
	@Override
	public List<CommentVO> myCommentList(PagingVO page) {
		return mybatis.selectList("board.getMyComment", page);
	}

	@Override
	public void myListDelete() {
		// TODO Auto-generated method stub

	}
}
