package com.bitcamp.project.service;

import java.util.List;

import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.UserVO;

public interface MyPostService {
	public void myListSearch();
	public void myCommentList();
	public List<BoardVO> myPostList(UserVO loginUser);
	public void myListDelete();
}
