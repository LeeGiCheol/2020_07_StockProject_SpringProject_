package com.bitcamp.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.BoardDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	
	
	@Override
	public int writeFreeBoard(BoardVO vo) {
		return mybatis.insert("board.writeFreeBoard", vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		System.out.println("update "+vo);
		return mybatis.update("board.updateBoard", vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		return mybatis.delete("board.deleteBoard", vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO)mybatis.selectOne("board.getBoard", vo);
	}
	
	// ajax 때문에 getBoard안에 못넣음 (2번실행되서)
	public int updateViews(BoardVO vo) { 
		return mybatis.update("board.updateViews",vo);
	}
	@Override
	public List<BoardVO> getBoardList(PagingVO vo) {
		return mybatis.selectList("board.boardList", vo);
	}

	@Override
	public List<BoardVO> getPopularBoardList(PagingVO vo) {
		return mybatis.selectList("board.popularboardList", vo);
	}

	public int count(BoardVO vo) {
		return mybatis.selectOne("board.boardCount", vo);
	}

	@Override
	public int commentCount(BoardVO vo) {
		return mybatis.update("board.commentCount", vo);
	}
	
	// 자유게시판 좋아요
	public int boardLikes(BoardVO vo) {
		int userLikeCount = mybatis.selectOne("board.userLikesCount", vo);
		
		// 한명의 유저가 한 게시물에 대해 좋아요가 0개일때(좋아요를 누른경우)
		if(userLikeCount == 0) {
			mybatis.insert("board.likesPlusList", vo);
			mybatis.update("board.likesPlusBoard", vo);
			return userLikeCount;
		}
		// 한명의 유저가 한 게시물에 대해 좋아요가 1개일때(좋아요 취소를 누른경우)
		else {
			mybatis.delete("board.likesMinusList", vo);
			mybatis.update("board.likesMinusBoard", vo);
			return userLikeCount;
		}
	}
	
	public List<BoardVO> boardPrevNext(BoardVO vo){
		return mybatis.selectList("board.prev_next", vo);
	}
	
	public int deleteBoardComment(BoardVO vo) {
		return mybatis.update("board.deleteBoardComment", vo);
	}
	
	public int reportBoard(BoardVO vo) {
		return mybatis.insert("board.reportBoard", vo);
	}
	public int reportBoardCount(BoardVO vo) {
		return mybatis.selectOne("board.reportBoardCount", vo);
	}
	
	@Override
	public List<BoardVO> portfolioList(PagingVO vo) {
		return mybatis.selectList("board.portfolioList", vo);
	}

	@Override
	public List<BoardVO> ServiceCenternotice(BoardVO vo) {
		return mybatis.selectList("board.ServiceCenternotice");
	}

	
	
	
	
}
