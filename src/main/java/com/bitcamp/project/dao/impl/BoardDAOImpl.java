package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.vo.BoardVO;

public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	
	
	@Override
	public void insertBoard(BoardVO vo) {
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return null;
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}

}
