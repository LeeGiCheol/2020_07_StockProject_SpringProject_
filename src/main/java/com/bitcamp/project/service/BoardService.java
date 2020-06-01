package com.bitcamp.project.service;

import java.util.List;

import com.bitcamp.project.vo.BoardVO;


public interface BoardService {
	public int writeFreeBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
//	void uploadBoard(BoardVO vo) throws IllegalStateException, IOException;
	
	List<BoardVO> getBoardList(BoardVO vo);
	
}
