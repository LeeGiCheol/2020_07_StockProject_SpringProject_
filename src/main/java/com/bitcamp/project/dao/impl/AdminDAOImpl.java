package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.AdminDAO;
import com.bitcamp.project.vo.AdminVO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;
import com.bitcamp.project.vo.VisitVO;

@Repository("AdminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int writeQuestion(AdminVO vo) {
		return mybatis.insert("admin.writeQuestion", vo);
	}
	@Override
	public int writeAnswer(AdminVO vo) {
		int cnt = mybatis.insert("admin.writeAnswer", vo);
		if(cnt == 1) {
			vo.setQcheck("답변완료");
			mybatis.update("admin.answerSuceess",vo);
		}
		
		return cnt;
	}

	@Override
	public int updateAnswer(AdminVO vo) {
		return mybatis.update("admin.updateAnswer", vo);
	}
	@Override
	public int qnaCount(AdminVO vo) {
		return mybatis.selectOne("admin.qnaCount", vo);
	}
	@Override
	public int pageCount(AdminVO vo) {
		return mybatis.selectOne("admin.pageCount", vo);
	}
	@Override
	public List<AdminVO> qnaList(PagingVO qnaPage) {
		return mybatis.selectList("admin.qnaList", qnaPage);
	}
	
	@Override
	public List<AdminVO> reportList(PagingVO reportPage) {
		return mybatis.selectList("admin.reportList", reportPage);
	}
	
	@Override
	public AdminVO reportSelectList(String rno) {
		return mybatis.selectOne("admin.reportSelectList",rno);
	}
	//게시판에 뿌려주기용
	@Override
	public AdminVO showReport(String pno) {
		return mybatis.selectOne("admin.showReport", pno);
	}
	
	
	@Override
	public int reportCount(AdminVO vo) {
		return mybatis.selectOne("admin.reportCount", vo)	;
	}
	
	public AdminVO qnaDetail(AdminVO vo) {
		return (AdminVO)mybatis.selectOne("admin.qnaDetail", vo);
	}

	@Override
	public int questionDelete(AdminVO vo) {
		return mybatis.delete("admin.questionDelete", vo);
	}
	
	@Override
	public int answerDelete(AdminVO vo) {
		return mybatis.delete("admin.answerDelete", vo);
	}
	@Override
	public int qnaUpdate(AdminVO vo) {
		System.out.println("update "+vo);
		return mybatis.update("admin.qnaUpdate", vo);
	}
	@Override
	public List<BoardVO> boardChart(BoardVO vo) {
		return mybatis.selectList("admin.boardChart", vo);
	}
	@Override
	public int updateRcheck(int pno) {
		return mybatis.update("admin.updateRcheck", pno);
	}
	
	@Override
	public List<UserVO> userSignUpChart(UserVO vo) {
		return mybatis.selectList("admin.userSignUpChart", vo);
	}
	
	
	
	
	
}
