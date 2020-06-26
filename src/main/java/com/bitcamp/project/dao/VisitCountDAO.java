package com.bitcamp.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.vo.AdminVO;

@Repository("visitCounterDAO")
public class VisitCountDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
    public int insertVisitor(AdminVO vo) {
    	System.out.println("asdglsadgbjlksdabfkjadsblf");
        return mybatis.insert("VisitCounterDAO_insertVisitor",vo);
    }

}
