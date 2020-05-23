//package com.bitcamp.project.dao.impl;
//
//import java.util.List;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.bitcamp.project.dao.BoardDAO;
//import com.bitcamp.project.vo.BoardVO;
//
//@Repository("boardDAO")
//public class BoardDAOMyBatisTemplate implements BoardDAO {
//
//	@Autowired
//	private SqlSessionTemplate mybatis;
//
//	
//	@Override
//	public void insertBoard(BoardVO vo) {
//		System.out.println("===> MyBatis로 insertBoard() 기능 처리");
//		mybatis.insert("BoardDAO.insertBoard", vo);
//	}
//
//	@Override
//	public void updateBoard(BoardVO vo) {
//		System.out.println("===> MyBatis로 updateBoard() 기능 처리");
//		mybatis.update("BoardDAO.updateBoard", vo);
//	}
//
//	@Override
//	public void deleteBoard(BoardVO vo) {
//		System.out.println("===> MyBatis로 deleteBoard() 기능 처리");
//		mybatis.delete("BoardDAO.deleteBoard", vo);
//	}
//
//	@Override
//	public BoardVO getBoard(BoardVO vo) {
//		System.out.println("===> MyBatis로 getBoard() 기능 처리");
//		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
//	}
//
//	@Override
//	public List<BoardVO> getBoardList(BoardVO vo) {
//		System.out.println("===> MyBatis로 getBoardList() 기능 처리");
//		return mybatis.selectList("BoardDAO.getBoardList", vo);
//	}
//	
//	
//}
