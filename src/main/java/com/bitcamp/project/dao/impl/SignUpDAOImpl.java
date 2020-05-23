package com.bitcamp.project.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.SignUpDAO;
import com.bitcamp.project.vo.UserVO;

@Repository("SignUpDAO")
public class SignUpDAOImpl implements SignUpDAO {

	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	@Override
	public void signUp(UserVO vo) {
		mybatis.insert("user.signUp", vo);
		
		// 추천인 입력 시 포인트 증가
		if(vo.getFriend() != null && vo.getFriend() !="") {
			System.out.println("id==="+vo.getId());
			System.out.println("friend==="+vo.getFriend());
			mybatis.update("user.pointUp", vo);
		}
		
	}

	@Override
	public int duplicateCheck(Map<String, String> map) {
		System.out.println("DAO"+map.get("id"));
		System.out.println("DAO2 "+map.get("nickname"));
		int result = mybatis.selectOne("user.idCheck", map);
		System.out.println(result);
		return result;
	}

	

}
