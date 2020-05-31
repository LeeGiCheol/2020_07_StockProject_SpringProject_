package com.bitcamp.project.dao.impl;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.MyPostDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
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

	@Override
	public List<BoardVO> myBoardList(UserVO loginUser) {
		return mybatis.selectList("board.getMyPost", loginUser);
	}
	
	@Override
	public List<CommentVO> myCommentList(UserVO loginUser) {
		return mybatis.selectList("board.getMyComment", loginUser);
	}

	@Override
	public void myListDelete() {
		// TODO Auto-generated method stub

	}

}
