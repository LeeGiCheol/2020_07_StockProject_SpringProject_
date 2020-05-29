package com.bitcamp.project.service;

import java.util.List;

import com.bitcamp.project.vo.BoardVO;


public interface BoardService {
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
//	void uploadBoard(BoardVO vo) throws IllegalStateException, IOException;
	
	List<BoardVO> getBoardList(BoardVO vo);
	
}
