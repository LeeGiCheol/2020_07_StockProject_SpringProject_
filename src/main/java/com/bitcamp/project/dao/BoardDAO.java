package com.bitcamp.project.dao;

import java.util.List;

import org.springframework.web.servlet.DispatcherServlet;

import com.bitcamp.project.vo.BoardVO;

public interface BoardDAO {
	public void insertBoard(BoardVO vo);
	public void updateBoard(BoardVO vo);
	public void deleteBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
	public List<BoardVO> getBoardList(BoardVO vo);
	
	

}
