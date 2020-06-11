package com.bitcamp.project.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.UserInfoDAO;
import com.bitcamp.project.vo.UserVO;

@Repository("UserInfoDAO")
public class UserInfoDAOImpl implements UserInfoDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	@Override
	public void deleteNotice(String id) {
		mybatis.delete("user.deleteNotice", id);
	}

	@Override
	public List getNotice(String id) {
		List notice = new ArrayList<>(); 
		notice.add(mybatis.selectList("user.getTradeNotice", id));
		notice.add(mybatis.selectList("user.getCommentNotice", id));
		return notice;  //여기서부터 수정 user mapping getNotice 수정
	}

	@Override
	public void memberInfo() {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberDelete() {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberInfoUpdate(UserVO vo) {
		mybatis.update("user.updateUser", vo);
	}

	@Override
	public void updatePassword(UserVO vo) {
		mybatis.update("user.mypageUpdatePassword", vo);
	}
	
}
