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
	
	public int commentCount(BoardVO vo) {
		return boardDAO.commentCount(vo);
	}


	@Override
	public Map<String, Object> boardList(BoardVO vo, int nowPage, String searchStyle, String keyword, String orderby) {
		PagingVO boardPage = new PagingVO(boardDAO.count(vo), nowPage, 30);
		boardPage.getUtil().put("searchStyle", searchStyle);
		boardPage.getUtil().put("keyword", keyword);
		boardPage.getUtil().put("orderby", orderby);
		
//		boardPage.getUtil().put("",vo.get)
//		boardPage.setId(vo.getId());
		List<BoardVO> boardList = boardDAO.getBoardList(boardPage);
		
		
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("boardList", boardList);
		postMap.put("boardPage", boardPage);
		return postMap;
	}
	
	public List<BoardVO> boardPrevNext(BoardVO vo){
		
		return boardDAO.boardPrevNext(vo);
	}
	

	
	public int updateViews(BoardVO vo) {
		return boardDAO.updateViews(vo);
	}
	
	public int boardLikes(BoardVO vo) {
		return boardDAO.boardLikes(vo);
	}

	
	public int reportBoard(BoardVO vo) {
		return boardDAO.reportBoard(vo);
	}
	
	
}