package com.bitcamp.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.MyPostDAO;
import com.bitcamp.project.service.MyPostService;
import com.bitcamp.project.vo.BoardVO;
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
	public List<BoardVO> myPostList(UserVO loginUser) {
		return myPostDAO.myPostList(loginUser);
	}

	@Override
	public void myListDelete() {
		// TODO Auto-generated method stub

	}

}
