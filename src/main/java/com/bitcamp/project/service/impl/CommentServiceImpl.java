package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.dao.CommentDAO;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int writeComment(CommentVO vo) {
		return commentDAO.writeComment(vo);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return commentDAO.updateComment(vo);
	}

	@Override
	public int deleteComment(CommentVO vo, BoardVO bVo) {
		System.out.println("서비스 " + bVo);
		boardDAO.deleteBoardComment(bVo);
		return commentDAO.deleteComment(vo);
	}


	@Override
	public Map<String, Object> commentList(CommentVO vo, int nowPage) {
		PagingVO commentPage = new PagingVO(commentDAO.count(vo), nowPage, 10);
		commentPage.getUtil().put("pno", vo.getPno());
		List<CommentVO> commentList = commentDAO.getCommentList(commentPage);
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("commentList", commentList);
		
		postMap.put("commentPage", commentPage);
		return postMap;
	}

	public int count(CommentVO vo) {
		return commentDAO.count(vo);
	}
	
	
	public int commentNoticeInsert(BoardVO vo) {
		return commentDAO.commentNoticeInsert(vo);
	}


	

	
	
	

}
