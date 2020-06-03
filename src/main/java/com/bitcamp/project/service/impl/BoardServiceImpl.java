package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int writeFreeBoard(BoardVO vo) {
		return boardDAO.writeFreeBoard(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		return boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	
	public int count(BoardVO vo) {
		return boardDAO.count(vo);
	}

	@Override
	public Map<String, Object> boardList(BoardVO vo, int nowPage) {
		PagingVO boardPage = new PagingVO(boardDAO.count(vo), nowPage, 10);
//		boardPage.getUtil().put("",vo.get)
//		boardPage.setId(vo.getId());
		List<BoardVO> boardList = boardDAO.getBoardList(boardPage);
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("boardList", boardList);
		postMap.put("boardPage", boardPage);
		
		return postMap;
	}

	

}