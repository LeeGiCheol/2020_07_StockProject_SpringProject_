package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.MyPostDAO;
import com.bitcamp.project.service.MyPostService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
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
	public Map<String, Object> myPostList(UserVO loginUser) {
		List<BoardVO> myBoard = myPostDAO.myBoardList(loginUser);
		List<CommentVO> myComment = myPostDAO.myCommentList(loginUser);
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("myBoard", myBoard);
		postMap.put("myComment", myComment);
		return postMap;
	}

	@Override
	public void myListDelete() {
		// TODO Auto-generated method stub

	}

}
