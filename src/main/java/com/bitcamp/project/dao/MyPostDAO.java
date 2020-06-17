package com.bitcamp.project.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

public interface MyPostDAO {
	public void myListSearch();
	public void myCommentList();
	public int countBoard(UserVO loginUser);
	public int countComment(UserVO loginUser);
	public List<BoardVO> myBoardList(PagingVO page);
	public List<CommentVO> myCommentList(PagingVO page);
	public void deleteMyPost(Map<String, String> myMap, String pno);
	
}
