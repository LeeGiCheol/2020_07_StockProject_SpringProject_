package com.bitcamp.project.dao;

import java.util.List;

import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;

public interface BoardDAO {
	public int writeFreeBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
	public List<BoardVO> getBoardList(PagingVO vo);
	public List<BoardVO> getPopularBoardList(PagingVO vo);
	public int count(BoardVO vo);
	public int commentCount(BoardVO vo);
	public int updateViews(BoardVO vo);
	public int boardLikes(BoardVO vo);
	public List<BoardVO> boardPrevNext(BoardVO vo);
}
