package com.bitcamp.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.UserInfoDAO;
import com.bitcamp.project.service.UserInfoService;
import com.bitcamp.project.vo.UserVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO userInfoDAO;
	
	
	
	@Override
	public void deleteNotice(String id) {
		userInfoDAO.deleteNotice(id);
	}

	@Override
	public List getNotice(String id) {
		return userInfoDAO.getNotice(id);
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
		userInfoDAO.memberInfoUpdate(vo);
	}

	@Override
	public void updatePassword(UserVO vo) {
		userInfoDAO.updatePassword(vo);
	}

	@Override
	public int mypageUpdatePasswordCheck(Map<String, String> map) {
		return userInfoDAO.mypageUpdatePasswordCheck(map);
	}

	

}
