package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.vo.BoardVO;

@Repository("BoardDAODAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	
	
	@Override
	public int writeFreeBoard(BoardVO vo) {
		return mybatis.insert("board.writeFreeBoard", vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return mybatis.update("board.updateBoard", vo);
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
		return mybatis.selectList("board.getBoardList", vo);
	}

}
