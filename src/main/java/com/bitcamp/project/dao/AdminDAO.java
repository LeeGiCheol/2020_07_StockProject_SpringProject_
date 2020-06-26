package com.bitcamp.project.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.AdminVO;
import com.bitcamp.project.vo.BoardVO;

public interface AdminDAO {
	public int writeQuestion(AdminVO vo);
	public int writeAnswer(AdminVO vo);
	public int updateAnswer(AdminVO vo);
	public int qnaCount(AdminVO vo);
	public int pageCount(AdminVO vo);
	public List<AdminVO> qnaList(PagingVO qnaPage); 
	public AdminVO qnaDetail(AdminVO vo);
	public int questionDelete(AdminVO vo);
	public int answerDelete(AdminVO vo);
	public int qnaUpdate(AdminVO vo);
	public List<AdminVO> reportList(PagingVO reportPage);
	public AdminVO reportSelectList(String rno);
	public int reportCount(AdminVO vo);
	public List<BoardVO> boardChart(BoardVO vo);
	public int updateRcheck(int pno);
}
