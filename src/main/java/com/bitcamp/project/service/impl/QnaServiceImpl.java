package com.bitcamp.project.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.QnaDAO;
import com.bitcamp.project.service.QnaService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.QnaVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDAO qnaDAO;
	@Autowired
	HttpSession session;
	
	
	@Override
	public int writeQna(QnaVO vo) {
		return qnaDAO.writeQna(vo);
	}

	@Override
	public Map<String, Object> qnaList(QnaVO vo, int nowPage, int page, String searchStyle, String keyword) {
		
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
//		boardPage.getUtil().put("",vo.get)
//		boardPage.setId(vo.getId());
		Map<String, Object> postMap = new HashMap<String, Object>();
	
		
		
		PagingVO qnaPage = new PagingVO(qnaDAO.countQna(vo), nowPage, page);
		
		qnaPage.getUtil().put("searchStyle", searchStyle);
		qnaPage.getUtil().put("keyword", keyword);
		qnaPage.getUtil().put("id", vo.getId());
			
			List<QnaVO> qnaList = qnaDAO.qnaList(qnaPage);
System.out.println("@@@@@ "+qnaList);
//			for (int i = 0; i < qnaList.size(); i++) {
//				qnaList.get(i).setBdateTime(new Date(qnaList.get(i).getBdateTime().getTime()- (1000 * 60 * 60 * 9)));
//			}
		postMap.put("qnaList", qnaList);
		postMap.put("qnaPage", qnaPage);
		return postMap;
	}

	
	public QnaVO qnaDetail(QnaVO vo) {
		return qnaDAO.qnaDetail(vo);
	}
	
	public int qnaDelete(QnaVO vo) {
		return qnaDAO.qnaDelete(vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		return qnaDAO.qnaUpdate(vo);
	}

	
}
