package com.bitcamp.project.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.VisitCountDAO;
import com.bitcamp.project.vo.VisitVO;

@Repository("visitCounterDAO")
public class VisitCountDAOImpl implements VisitCountDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
    public int insertVisitor(VisitVO vo) {
    	System.out.println("asdglsadgbjlksdabfkjadsblf");
        return mybatis.insert("admin.insertVisit",vo);
    }

	@Override
	public List<VisitVO> userVisitChart(VisitVO vo) {
		return mybatis.selectList("admin.userVisitChart", vo);
	}

    
    
}
