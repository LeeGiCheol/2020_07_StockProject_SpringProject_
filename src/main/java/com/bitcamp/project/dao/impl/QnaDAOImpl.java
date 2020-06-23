package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.QnaDAO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.QnaVO;

@Repository("QnaDAO")
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int writeQna(QnaVO vo) {
		return mybatis.insert("qna.writeQna", vo);
	}

	@Override
	public List<QnaVO> qnaList(PagingVO qnaPage) {
		return mybatis.selectList("qna.qnaList", qnaPage);
	}

	@Override
	public int countQna(QnaVO vo) {
		return mybatis.selectOne("qna.countQna", vo);
	}
	
	public QnaVO qnaDetail(QnaVO vo) {
		return (QnaVO)mybatis.selectOne("qna.qnaDetail", vo);

	}

	@Override
	public int qnaDelete(QnaVO vo) {
		return mybatis.delete("qna.qnaDelete", vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		System.out.println("여기 " + vo);
		return mybatis.update("qna.qnaUpdate", vo);
	}
	
	
	

	
	
	
	
}
