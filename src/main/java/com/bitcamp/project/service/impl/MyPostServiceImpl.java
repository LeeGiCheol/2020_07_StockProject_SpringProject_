package com.bitcamp.project.service.impl;

import java.util.Date;
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
	public Map<String, Object> myPostList(UserVO loginUser, int bnowPage, int cnowPage,
			String bSearchStyle, String boardKeyword, String commentKeyword) {
		PagingVO boardPage = new PagingVO(myPostDAO.countBoard(loginUser), bnowPage, 3);
		PagingVO commentPage = new PagingVO(myPostDAO.countComment(loginUser), cnowPage, 3);
		boardPage.getUtil().put("id", loginUser.getId());
		boardPage.getUtil().put("bSearchStyle", bSearchStyle);
		boardPage.getUtil().put("boardKeyword", boardKeyword);
		commentPage.getUtil().put("id", loginUser.getId());
		commentPage.getUtil().put("commentKeyword", commentKeyword);

		List<BoardVO> myBoard = myPostDAO.myBoardList(boardPage);
		for (int i = 0; i < myBoard.size(); i++) {
			myBoard.get(i).setBdateTime(new Date(myBoard.get(i).getBdateTime().getTime()- (1000 * 60 * 60 * 9)));
		}
		
		List<CommentVO> myComment = myPostDAO.myCommentList(commentPage);
		for (int i = 0; i < myComment.size(); i++) {
			myComment.get(i).setCdateTime(new Date(myComment.get(i).getCdateTime().getTime()- (1000 * 60 * 60 * 9)));
		}
		
		Map<String, Object> postMap = new HashMap<String, Object>();
		postMap.put("myBoard", myBoard);
		postMap.put("myComment", myComment);
		System.out.println("코멘트 "+myComment);
		postMap.put("boardPage", boardPage);
		postMap.put("commentPage", commentPage);
		
		return postMap;
	}

	@Override
	public void deleteMyPost(String deleted[], String type) {
		Map<String, String> myMap = new HashMap<String, String>();
		myMap.put("type", type);
		String deleted2[] = new String[deleted.length]; //삭제 될 comment의 pno배열
		String deletedCno[] = new String[deleted.length/2];
		if(type.equals("comment")) {
			System.out.println("comment일때만 발동!");
			for (int i = 0; i < deleted.length; i++) {
				if(i % 2 == 1)
					deleted2[i/2] = deleted[i];
				else
					deletedCno[i/2] = deleted[i];
			}
			deleted = deletedCno;
		}
		
		System.out.println("del leng" + deleted.length);
		for (int i = 0; i < deleted.length; i++) {
			System.out.println(deleted[i]);
			myMap.put("no", deleted[i]);
			myPostDAO.deleteMyPost(myMap, deleted2[i]);
			
		}
	}
	
	public UserVO selectUser(UserVO vo) {
		return myPostDAO.selectUser(vo);
	}

}
