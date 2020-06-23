package com.bitcamp.project.dao;

import java.util.List;

import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.AdminVO;

public interface AdminDAO {
	public int writeQuestion(AdminVO vo);
	public int writeAnswer(AdminVO vo);
	public int qnaCount(AdminVO vo);
	public List<AdminVO> qnaList(PagingVO qnaPage); 
	public AdminVO qnaDetail(AdminVO vo);
	public int qnaDelete(AdminVO vo);
	public int qnaUpdate(AdminVO vo);
}
