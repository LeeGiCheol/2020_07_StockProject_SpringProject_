package com.bitcamp.project.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.BoardVO;


public interface BoardService {
	public int writeFreeBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
//	void uploadBoard(BoardVO vo) throws IllegalStateException, IOException;
	public int count(BoardVO vo);
	public int commentCount(BoardVO vo);
	public Map<String, Object> boardList(BoardVO vo, int nowPage, String searchStyle, String keyword, String orderby);
	public int updateViews(BoardVO vo);
	public int boardLikes(BoardVO vo);
	public List<BoardVO> boardPrevNext(BoardVO vo);
	public int reportBoard(BoardVO vo);

}
