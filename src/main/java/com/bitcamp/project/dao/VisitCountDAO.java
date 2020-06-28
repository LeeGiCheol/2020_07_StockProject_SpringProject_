package com.bitcamp.project.dao;

import java.util.List;

import com.bitcamp.project.vo.VisitVO;

public interface VisitCountDAO{
	

	
    public int insertVisitor(VisitVO vo);
    public List<VisitVO> userVisitChart(VisitVO vo);
    
}
