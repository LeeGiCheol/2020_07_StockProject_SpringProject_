package com.bitcamp.project.dao;

import java.util.List;

import com.bitcamp.project.vo.UserVO;

public interface UserInfoDAO {
	public void memberInfo();
	public void memberDelete();
	public void memberInfoUpdate(UserVO vo);
	public List getNotice(String id);
}
