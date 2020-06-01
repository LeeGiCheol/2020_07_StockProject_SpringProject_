package com.bitcamp.project.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.MyPostDAO;
import com.bitcamp.project.service.MyPostService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class MyPostServiceImpl implements MyPostService {
	
	@Autowired
	MyPostDAO myPostDAO;
	
	@Override
	public void myListSearch() {
		// TODO Auto-generated method stub

	}

	@Override
	public void myCommentList() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, Object> myPostList(UserVO loginUser, int nowPage) {
		PagingVO boardPage = new PagingVO(myPostDAO.countBoard(loginUser), nowPage, 3);
		PagingVO commentPage = new PagingVO(myPostDAO.countBoard(loginUser), nowPage, 3);
		boardPage.setId(loginUser.getId());
		commentPage.setId(loginUser.getId());
		List<BoardVO> myBoard = myPostDAO.myBoardList(boardPage);
		List<CommentVO> myComment = myPostDAO.myCommentList(commentPage);
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("myBoard", myBoard);
		postMap.put("myComment", myComment);
		postMap.put("boardPage", boardPage);
		postMap.put("commentPage", commentPage);
		
		return postMap;
	}

	@Override
	public void myListDelete() {

	}

}
