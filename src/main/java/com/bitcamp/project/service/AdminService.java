package com.bitcamp.project.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.AdminVO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.UserVO;


public interface AdminService {
	public int writeQuestion(AdminVO vo);
	public int writeAnswer(AdminVO vo);
	public int updateAnswer(AdminVO vo);
	public int qnaCount(AdminVO vo);
	public Map<String, Object> qnaList(AdminVO vo, int nowPage, String searchStyle, String keyword, int page, String orderby);
	public AdminVO qnaDetail(AdminVO vo);
	public int questionDelete(AdminVO vo);
	public int answerDelete(AdminVO vo);
	public int qnaUpdate(AdminVO vo);
	public Map<String, Object> reportList(AdminVO vo, int nowPage, int page, String searchStyle, String keyword);
	public List<BoardVO> boardChart(BoardVO vo);
	public List<UserVO> userSignUpChart(UserVO vo);
	public Map<String, Object> reportSelectList(AdminVO vo,String pno);
	public int userVisit(AdminVO vo);

}
