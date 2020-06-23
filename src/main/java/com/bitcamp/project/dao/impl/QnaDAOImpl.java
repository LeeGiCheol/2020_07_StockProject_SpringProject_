package com.bitcamp.project.dao.impl;

import java.util.List;

import javax.servlet.jsp.el.ELParseException;

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
	public int writeQuestion(QnaVO vo) {
		return mybatis.insert("qna.writeQuestion", vo);
	}
	@Override
	public int writeAnswer(QnaVO vo) {
		int cnt = mybatis.insert("qna.writeAnswer", vo);
		if(cnt == 1) {
			vo.setQcheck("답변완료");
			mybatis.update("qna.answerSuceess",vo);
		}
		System.out.println("test "+cnt);
		
		return cnt;
	}
	
	
	

	@Override
	public int countQna(QnaVO vo) {
		return mybatis.selectOne("qna.countQna", vo);
	}
	@Override
	public List<QnaVO> qnaList(PagingVO qnaPage) {
		return mybatis.selectList("qna.qnaList", qnaPage);
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
