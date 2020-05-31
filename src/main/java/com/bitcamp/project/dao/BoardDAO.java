package com.bitcamp.project.dao;

import java.util.List;

import com.bitcamp.project.vo.BoardVO;

public interface BoardDAO {
	public int writeFreeBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
	public List<BoardVO> getBoardList(BoardVO vo);
}
