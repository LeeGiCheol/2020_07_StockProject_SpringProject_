package com.bitcamp.project.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	HttpSession session;
	
	@Override
	public int writeFreeBoard(BoardVO vo) {
		return boardDAO.writeFreeBoard(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		return boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		
		return boardDAO.getBoard(vo);
	}

	
	public int count(BoardVO vo) {
		return boardDAO.count(vo);
	}
	
	public int commentCount(BoardVO vo) {
		return boardDAO.commentCount(vo);
	}
	
	public List<BoardVO> ServiceCenternotice(BoardVO vo){
		return boardDAO.ServiceCenternotice(vo);
	}

	@Override
	public Map<String, Object> boardList(BoardVO vo, int nowPage, String searchStyle, String keyword, String orderby, int bno, int page) {
		PagingVO boardPage = null;
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
//		boardPage.getUtil().put("",vo.get)
//		boardPage.setId(vo.getId());
		List<BoardVO> boardList = null;
		List<BoardVO> portfolioList = null;
		Map<String, Object> postMap = new HashMap<String, Object>();
		vo.setBno(bno);

		// 자유게시판 // 공지사항
		if(bno == 1 || bno == 3) {
			boardPage = new PagingVO(boardDAO.count(vo), nowPage, page);
			boardPage.getUtil().put("searchStyle", searchStyle);
			boardPage.getUtil().put("keyword", keyword);
			boardPage.getUtil().put("orderby", orderby);
			boardPage.getUtil().put("bno", bno);
			
			boardList = boardDAO.getBoardList(boardPage);
			for (int i = 0; i < boardList.size(); i++) {
				boardList.get(i).setBdateTime(new Date(boardList.get(i).getBdateTime().getTime()- (1000 * 60 * 60 * 9)));
			}
			postMap.put("boardList", boardList);
		}
		// 포트폴리오 게시판
		else if(bno == 2) {
			boardPage = new PagingVO(boardDAO.count(vo), nowPage, page);

			boardPage.getUtil().put("searchStyle", searchStyle);
			boardPage.getUtil().put("keyword", keyword);
			boardPage.getUtil().put("orderby", orderby);
			boardPage.getUtil().put("bno", bno);
			
			portfolioList = boardDAO.portfolioList(boardPage);

			for (int i = 0; i < portfolioList.size(); i++) {
				portfolioList.get(i).setBdateTime(new Date(portfolioList.get(i).getBdateTime().getTime()- (1000 * 60 * 60 * 9)));
			}
			postMap.put("portfolioList", portfolioList);
		}
		
	
		
		
		postMap.put("boardPage", boardPage);
		return postMap;
	}
	
	public List<BoardVO> boardPrevNext(BoardVO vo){
		
		return boardDAO.boardPrevNext(vo);
	}
	

	
	public int updateViews(BoardVO vo) {
		return boardDAO.updateViews(vo);
	}
	
	public int boardLikes(BoardVO vo) {
		return boardDAO.boardLikes(vo);
	}

	
	public int reportBoard(BoardVO vo) {
		int count = boardDAO.reportBoardCount(vo);
		if(count == 0) {
			return boardDAO.reportBoard(vo);
		}
		else
			return -1;
	}
	
	
	
}