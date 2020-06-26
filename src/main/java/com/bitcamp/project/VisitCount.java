package com.bitcamp.project;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class VisitCount {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void todayVisit() {
		
	}
}
