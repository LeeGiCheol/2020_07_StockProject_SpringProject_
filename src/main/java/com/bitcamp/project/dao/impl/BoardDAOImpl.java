package com.bitcamp.project.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;

@Repository("BoardDAO")
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
	public int deleteBoard(BoardVO vo) {
		return mybatis.delete("board.deleteBoard", vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO)mybatis.selectOne("board.getBoard", vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO bVo, PagingVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardVO", bVo);
		map.put("PagingVO", vo);
		return mybatis.selectList("board.boardList", map);
	}

	public int count(BoardVO vo) {
		return mybatis.selectOne("board.boardCount", vo);
	}
	

	
}
