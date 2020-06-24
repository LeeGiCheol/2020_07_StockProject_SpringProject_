package com.bitcamp.project.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.AdminDAO;
import com.bitcamp.project.service.AdminService;
import com.bitcamp.project.vo.AdminVO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	@Autowired
	HttpSession session;
	
	
	@Override
	public int writeQuestion(AdminVO vo) {
		return adminDAO.writeQuestion(vo);
	}
	@Override
	public int writeAnswer(AdminVO vo) {
		return adminDAO.writeAnswer(vo);
	}
	
	@Override
	public int qnaCount(AdminVO vo) {
		return adminDAO.qnaCount(vo);
	}
	
	

	@Override
	public Map<String, Object> qnaList(AdminVO vo, int nowPage, int page, String searchStyle, String keyword) {
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		
//		boardPage.getUtil().put("",vo.get)
//		boardPage.setId(vo.getId());
		Map<String, Object> postMap = new HashMap<String, Object>();
		PagingVO qnaPage = new PagingVO(adminDAO.pageCount(vo), nowPage, page);
		
		qnaPage.getUtil().put("searchStyle", searchStyle);
		qnaPage.getUtil().put("keyword", keyword);
		qnaPage.getUtil().put("id", vo.getId());
		
		if(loginUser.getPoint() < 0) {
			qnaPage.getUtil().put("point", loginUser.getPoint());
		}
		
			
		List<AdminVO> qnaList = adminDAO.qnaList(qnaPage);
		for (int i = 0; i < qnaList.size(); i++) {
			qnaList.get(i).setQdateTime(new Date(qnaList.get(i).getQdateTime().getTime()- (1000 * 60 * 60 * 9)));
			if(qnaList.get(i).getAno() != 0) {
				qnaList.get(i).setAdateTime(new Date(qnaList.get(i).getAdateTime().getTime()- (1000 * 60 * 60 * 9)));
				
			}
		}
		
		postMap.put("qnaList", qnaList);
		postMap.put("qnaPage", qnaPage);
		return postMap;
	}
	
	@Override
	public Map<String, Object> reportList(AdminVO vo, int nowPage, int page, String searchStyle, String keyword) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		Map<String, Object> postMap = new HashMap<String, Object>();
		PagingVO reportPage = new PagingVO(10, nowPage, page);
		reportPage.getUtil().put("searchStyle", searchStyle);
		reportPage.getUtil().put("keyword", keyword);
		/* reportPage.getUtil().put("id", vo.getId()); */
		
		if(loginUser.getPoint() < 0) {
			reportPage.getUtil().put("point", loginUser.getPoint());
		}
			
		List<AdminVO> reportList = adminDAO.reportList(reportPage);
		postMap.put("reportList", reportList);
		postMap.put("reportPage", reportPage);
		return postMap;
	}
	
	public AdminVO qnaDetail(AdminVO vo) {
		return adminDAO.qnaDetail(vo);
	}
	
	public int questionDelete(AdminVO vo) {
		return adminDAO.questionDelete(vo);
	}

	@Override
	public int qnaUpdate(AdminVO vo) {
		return adminDAO.qnaUpdate(vo);
	}
	@Override
	public int answerDelete(AdminVO vo) {
		return adminDAO.answerDelete(vo);
	}
	@Override
	public List<BoardVO> boardChart(BoardVO vo) {
		return adminDAO.boardChart(vo);
	}
	
	
	
}
